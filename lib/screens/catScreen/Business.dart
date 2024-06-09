import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bloc.dart';
import '../../cubit/states.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';


class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).business;
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: color),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Text(
              'Business Screen',
              style: TextStyle(color: color, fontSize: 20, letterSpacing: 0.6),
            ),
          ),
          body:articlebuilder(list,context) ,
        );
      },
    );







  }
}
