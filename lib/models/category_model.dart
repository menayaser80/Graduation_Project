import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String id;
  String image;
  Color color;

  CategoryModel(this.name, this.id, this.image, this.color);

  static List<CategoryModel> getCategories(context) {
    return [
      CategoryModel("Sports",
          "sports", "assets/images/sports.png", Color(0xFFC91C22)),
      CategoryModel("General",
          "general", "assets/images/Politics.png", Color(0xFF003E90)),
      CategoryModel("Health",
          "health", "assets/images/health.png", Color(0xFFED1E79)),
      CategoryModel("Business",
          "business", "assets/images/bussines.png", Color(0xFFCF7E48)),
      CategoryModel("Entertainment",
          "entertainment", "assets/images/environment.png", Color(0xFF4882CF)),
      CategoryModel("Science",
          "science", "assets/images/science.png", Color(0xFFF2D352)),
      CategoryModel("Technology", "technology", "assets/images/bussines.png", Colors.red),
    ];
  }


}