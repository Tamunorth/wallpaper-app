import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imageURL;
  ImageView({@required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imageURL,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _save();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          border: Border.all(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                'Set Wallpaper',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white70),
                              ),
                              Text(
                                'Image will be saved to the gallery',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imageURL,
          destination: AndroidDestinationType.directoryDownloads);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }

//  _askPermission() async {
//    Map<Permission, PermissionStatus> statuses = await [
//      Permission.location,
//      Permission.storage,
//    ].request();
//    print(statuses[Permission.storage]);
//
//    bool isShown = await Permission.contacts.shouldShowRequestRationale;
//  }
}
