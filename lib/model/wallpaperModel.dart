class WallpaperModel {
  String photographer;
  String photographerURL;
  int photographerID;
  SrcModel src;

  WallpaperModel({
    this.photographer,
    this.photographerID,
    this.photographerURL,
    this.src,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData['src']),
      photographer: jsonData['photographer'],
      photographerID: jsonData['photographer_id'],
      photographerURL: jsonData['photographer_url'],
    );
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.portrait, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        portrait: jsonData['portrait'],
        original: jsonData['original'],
        small: jsonData['small']);
  }
}
