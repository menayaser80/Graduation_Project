import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../services/global_methods.dart';
import '../widgets/categories_widget.dart';
import 'catScreen/Business.dart';
import 'catScreen/EnterTainment.dart';
import 'catScreen/General.dart';
import 'catScreen/Health.dart';
import 'catScreen/Science.dart';
import 'catScreen/Sports.dart';
import 'catScreen/technology.dart';
class Category extends StatefulWidget {
  static const String routeName = 'cat';

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int Selectindex=0;
  final  List<Map<String,dynamic>> pages=[
    {
      'page': Sports(),
    },
    {
      'page': General(),
    },
    {
      'page': Health(),
    },
    {
      'page': Business(),
    },
    {
      'page': Entertainment(),
    },
    {
      'page': Science(),
    },

    {
      'page': Technology(),
    },
  ];
  void Selectedpage(int index){
    setState(() {
      Selectindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories(context);
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            title: Text("NewsApp"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                     itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
                    itemBuilder:(context,index)=> InkWell(
                        onTap: () {
                          navigateTo(context, pages[index]['page']);
                        },
                        child: CategoryItem(categories[index])),
                  ),
                  ),
      ],
    ),

            ),
          ),
        );
  }
}