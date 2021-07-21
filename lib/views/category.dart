import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/widget/widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryName;

  CategoriesScreen({this.categoryName});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<WallpaperModel> wallpapers = [];

  getCategoryWallpaper(String category) async {
    var response = await http.get(
        'https://api.pexels.com/v1/search?query=$category&per_page=8',
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
    getCategoryWallpaper(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            BrandName(),
            Text(
              widget.categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
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
