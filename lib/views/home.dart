import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:wallpaper_app/data/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  int statusCode;

  TextEditingController searchController = TextEditingController();

  getTrendingWallpaper() async {
    var response = await http
        .get('https://api.pexels.com/v1/curated?per_page=4&page=1', headers: {
      "Authorization": apiKey,
    });
    statusCode = response.statusCode;

    print(statusCode);

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      print(wallpaperModel.photographer);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpaper();
    categories = getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            BrandName(),
            SearchBar(
              searchController: searchController,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchScreen(
                      searchQuery: searchController.text,
                    );
                  }),
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(right: 5.0, left: 5.0),
              height: 80.0,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      categories: categories,
                      imageUrl: categories[index].imageURL,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            ),
            Expanded(
              child: WallpaperTile(
                wallpaperList: wallpapers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
