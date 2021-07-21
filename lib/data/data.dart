import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001bdd0d1084b8b463db31ff0c9eef0089a";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [
    CategoriesModel(
      imageURL:
          "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categoryName: "Street Art",
    ),
    CategoriesModel(
      imageURL:
          "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categoryName: "City",
    ),
    CategoriesModel(
      imageURL:
          "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categoryName: "Motivation",
    ),
    CategoriesModel(
      imageURL:
          "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categoryName: "Wild Life",
    ),
//    CategoriesModel(
//      imageURL:
//          "https://images.pexels.com/photos/34950/pexels-photo-34950.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500",
//      categoryName: "Nature",
//    ),
    CategoriesModel(
      imageURL:
          "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
      categoryName: "Bikes",
    ),
    CategoriesModel(
        imageURL:
            "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        categoryName: "Cars")
  ];
  return categories;
}

//CategoriesModel categoriesModel = CategoriesModel();
//
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "Street Art";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "Wild Life";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/34950/pexels-photo-34950.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "Nature";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "City";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
//categoriesModel.categoryName = "Motivation";
//
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "Bikes";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
//
////
//categoriesModel.imageURL =
//"https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
//categoriesModel.categoryName = "Cars";
//categories.add(categoriesModel);
//categoriesModel = new CategoriesModel();
