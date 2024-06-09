import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:newsapp_weather_graduation/screens/user.dart';

import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'Weather/Weather.dart';
import 'category.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
int Selectedindex=0;
final  List<Map<String,dynamic>> pages=[
  {
    'page':const HomeScreen(),
    'title':'Home Screen'
  },
  {
    'page': Category(),
    'title':'Category Screen',
  },
  {
    'page':const Weather(),
    'title':'Weather',
  },
  {
    'page': ChatScreen(),
    'title':'ChatGpt',
  },
  {
    'page': SettingScreen(),
    'title':'User Screen',
  },
];
void Selectedpage(int index){
setState(() {
  Selectedindex=index;
});
}
  @override
  Widget build(BuildContext context) {
    final themeState=Provider.of<ThemeProvider>(context);

    bool isdark= themeState.getDarkTheme;
    return Scaffold(

        body:pages[Selectedindex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:isdark
         ? Theme.of(context).cardColor
              :Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: Selectedindex,
          unselectedItemColor:isdark?Colors.white10:Colors.black12,
          selectedItemColor:isdark?Colors.lightBlue.shade200:Colors.black87,
          onTap: Selectedpage,
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(
             Selectedindex==0?IconlyBold.home: IconlyLight.home,
              ),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(
                Selectedindex==1?IconlyBold.category:  IconlyLight.category,
              ),
                label: 'categories',
              ),
              BottomNavigationBarItem(icon:
              // Badge(
              //   toAnimate: true,
              //   shape: BadgeShape.circle,
              //   badgeColor: Colors.blue,
              //   borderRadius: BorderRadius.circular(8),
              //   position: BadgePosition.topEnd(top: -7, end: -7),
              //   badgeContent: FittedBox(
              //       child: Textwidget(
              //           text: '1',
              //           color: Colors.white,
              //           textsize: 15)),
              //   child:
                Icon(
                  Selectedindex==2?IconlyBold.notification: IconlyLight.notification,
                ),

                label: 'Weather',
              ),
              BottomNavigationBarItem(icon:
              // Badge(
              //   toAnimate: true,
              //   shape: BadgeShape.circle,
              //   badgeColor: Colors.blue,
              //   borderRadius: BorderRadius.circular(8),
              //   position: BadgePosition.topEnd(top: -7, end: -7),
              //   badgeContent: FittedBox(
              //       child: Textwidget(
              //           text: '1',
              //           color: Colors.white,
              //           textsize: 15)),
              //   child:
              Icon(
                Selectedindex==3?IconlyBold.chat: IconlyLight.chat,
              ),

                label: 'ChatGpt',
              ),
              BottomNavigationBarItem(icon: Icon(
                Selectedindex==4?IconlyBold.user2:IconlyLight.user2,
              ),
                label: 'User Screen',
              ),
            ],
        ),
      );

  }
}
