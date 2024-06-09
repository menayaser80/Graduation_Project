import 'package:flutter/material.dart';

import '../models/category_model.dart';
class EmptyPages extends StatelessWidget {
  static const String routeName='page';
  CategoryModel categoryModel;

  EmptyPages(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("News")),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Text(categoryModel.name)),
    );
  }
}
