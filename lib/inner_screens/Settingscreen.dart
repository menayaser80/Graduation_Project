// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:newsapp/cubit/bloc.dart';
// import 'package:newsapp/cubit/states.dart';
// import 'package:newsapp/inner_screens/Weather.dart';
// import 'package:newsapp/screens/Edit%20profile.dart';
// import 'package:newsapp/services/global_methods.dart';
// class SettingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit,NewsStates>(
//       listener:(context,state){} ,
//       builder: (context,state){
//         var usermodel=NewsCubit.get(context).usermodel;
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Container(
//                 height: 190.0,
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: [
//                     Align(
//                       child: Container(
//                         height: 140.0,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(4.0,),
//                             topRight: Radius.circular(4.0,),
//                           ),
//                           image: DecorationImage(
//                             image: NetworkImage(
//                                 '${usermodel!.cover}'
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       alignment: AlignmentDirectional.topCenter,
//                     ),
//                     CircleAvatar(
//                       radius: 64.0,
//                       backgroundColor:Theme.of(context).scaffoldBackgroundColor,
//                       child: CircleAvatar(
//                         radius: 60.0,
//                         backgroundImage: NetworkImage('${usermodel.image}'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Text(
//                 '${usermodel.name}',
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//               Text(
//                 '${usermodel.bio}',
//                 style: Theme.of(context).textTheme.caption,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 20.0,
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         child: Column(
//                           children: [
//                             Text(
//                               '100',
//                               style: Theme.of(context).textTheme.subtitle2,
//                             ),
//                             Text(
//                               'posts',
//                               style: Theme.of(context).textTheme.caption,
//                             ),
//                           ],
//                         ),
//                         onTap: (){},
//                       ),
//                     ),
//                     Expanded(
//                       child: InkWell(
//                         child: Column(
//                           children: [
//                             Text(
//                               '265',
//                               style: Theme.of(context).textTheme.subtitle2,
//                             ),
//                             Text(
//                               'photos',
//                               style: Theme.of(context).textTheme.caption,
//                             ),
//                           ],
//                         ),
//                         onTap: (){},
//                       ),
//                     ),
//                     Expanded(
//                       child: InkWell(
//                         child: Column(
//                           children: [
//                             Text(
//                               '15k',
//                               style: Theme.of(context).textTheme.subtitle2,
//                             ),
//                             Text(
//                               'Followers',
//                               style: Theme.of(context).textTheme.caption,
//                             ),
//                           ],
//                         ),
//                         onTap: (){},
//                       ),
//                     ),
//                     Expanded(
//                       child: InkWell(
//                         child: Column(
//                           children: [
//                             Text(
//                               '65',
//                               style: Theme.of(context).textTheme.subtitle2,
//                             ),
//                             Text(
//                               'Followings',
//                               style: Theme.of(context).textTheme.caption,
//                             ),
//                           ],
//                         ),
//                         onTap: (){},
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 40.0,
//                       width: double.infinity,
//                       color: Colors.white,
//                       child: OutlinedButton(
//                         onPressed: (){},
//                         child:Text(
//                           'Add photos',style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   OutlinedButton(
//                     onPressed: (){
//                       navigateTo(context, Weather());
//                     },
//                     child:Icon(
//                       IconlyBold.edit,
//                       size: 16.0,
//                     ),
//
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }