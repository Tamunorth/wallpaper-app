import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/views/category.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:wallpaper_app/views/search.dart';

class BrandName extends StatelessWidget {
  const BrandName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Wallpaper',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Hub',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
          ),
        ),
      ]),
    );
  }
}

class WallpaperTile extends StatelessWidget {
  final List<WallpaperModel> wallpaperList;

  WallpaperTile({@required this.wallpaperList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpaperList.map((wallpaper) {
          return GridTile(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ImageView(
                      imageURL: wallpaper.src.portrait,
                    );
                  }),
                );

                print('Wallpaper Tapped');
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      placeholder: (context, wallpaperURL) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key key,
    @required this.categories,
    @required this.imageUrl,
    @required this.categoryName,
  }) : super(key: key);

  final List<CategoriesModel> categories;
  final String imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoriesScreen(
            categoryName: categoryName,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 100.0,
                height: 50.0,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function onTap;
  SearchBar({this.searchController, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Color(0xffF5F8FD),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
