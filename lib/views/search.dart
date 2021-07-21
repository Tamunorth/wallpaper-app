import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  final String searchQuery;

  SearchScreen({this.searchQuery});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = TextEditingController();

  getSearchWallpaper(String query) async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=$query&per_page=4',
        headers: {
          "Authorization": apiKey,
        });

    print(response.body.toString());

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
    getSearchWallpaper(widget.searchQuery);
    searchController.text = widget.searchQuery;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            BrandName(),
            SearchBar(
              searchController: searchController,
              onTap: () {
                getSearchWallpaper(searchController.text);
                setState(() {});
              },
            ),
            Text(searchController.text),
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
