import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:newsapp_weather_graduation/cubit/bloc.dart';
import 'package:newsapp_weather_graduation/cubit/states.dart';
import 'package:newsapp_weather_graduation/screens/Edit%20profile.dart';
import 'package:newsapp_weather_graduation/services/global_methods.dart';



class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var usermodel=NewsCubit.get(context).usermodel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:usermodel!=null? Column(
            children: [
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0,),
                            topRight: Radius.circular(4.0,),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${usermodel.cover}'
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage('${usermodel.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${usermodel.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${usermodel.bio}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${usermodel.shopping_address}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),

              ),
              Text(
                '${usermodel.phone}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'posts',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '265',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'photos',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '15k',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '65',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: OutlinedButton(
                        onPressed: (){},
                        child:Text(
                          'Add photos',style: TextStyle(
                          color: Colors.blue,
                        ),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    onPressed: (){
                      navigateTo(context, EditProfile());
                    },
                    child:Icon(
                      IconlyLight.edit,
                      size: 16.0,
                    ),

                  ),
                ],
              ),
            ],
          ):SizedBox(),
        );
      },
    );
  }
}