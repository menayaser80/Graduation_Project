//Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_weather_graduation/cubit/bloc.dart';
import 'package:newsapp_weather_graduation/providers/bookmarks_provider.dart';
import 'package:newsapp_weather_graduation/providers/chatprovider/chats_provider.dart';
import 'package:newsapp_weather_graduation/providers/chatprovider/models_provider.dart';
import 'package:newsapp_weather_graduation/providers/news_provider.dart';
import 'package:newsapp_weather_graduation/screens/auth/forget%20password.dart';
import 'package:newsapp_weather_graduation/screens/auth/login.dart';
import 'package:newsapp_weather_graduation/screens/category.dart';


import 'package:provider/provider.dart';

//Screens

//Consts
import 'consts/theme_data.dart';

//Providers
import 'cubit/bloc observer.dart';
import 'cubit/dio helper.dart';
import 'inner_screens/blog_details.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {

      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Need it to access the theme Provider
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  //Fetch the current theme
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  final Future<FirebaseApp> firebaseinitilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseinitilization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text('An Error occured'),
                ),
              ),
            );
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context)=>NewsCubit()..getUserData()
                ..getbusiness()
                ..getentertainment()..getgeneral()..gethealth()..getscience()..getsports()..gettecnology()
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => NewsProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => BookmarksProvider(),
                ),
                ChangeNotifierProvider(create: (_) {
                  //Notify about theme changes
                  return themeChangeProvider;
                }),
                ChangeNotifierProvider(
                  create: (_) => ModelsProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ChatProvider(),
                ),
              ],
              child: Consumer<ThemeProvider>(
                  builder: (context, themeChangeProvider, ch) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'News app',
                      theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
                      home: const LoginScreen(),
                      routes: {
                        NewsDetailsScreen.routeName: (ctx) =>
                        const NewsDetailsScreen(),
                        ForgetPasswordScreen.routeName: (ctx) =>
                        const ForgetPasswordScreen(),
                        LoginScreen.routeName: (ctx) => const LoginScreen(),
                        Category.routeName: (context) => Category(),
                      },
                    );
                  }),
            ),
          );
        });
  }
}
