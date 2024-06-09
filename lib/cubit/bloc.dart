
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:newsapp_weather_graduation/cubit/cashe%20helper.dart';
import 'package:newsapp_weather_graduation/cubit/states.dart';

import '../consts/firebase constants.dart';
import '../models/Newsusermodel.dart';
import '../models/WeatherModel.dart';
import '../services/WeatherServices.dart';
import 'dio helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(SocialInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  static final User? user = authInstance.currentUser;
  NewsUserModel? usermodel;
  final _uid = user!.uid;
  bool isdark = false;

  void changeappmode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(AppChangeDarkState());
    }
    else {
      isdark = !isdark;
      CachHelper.putBoolean(key: 'isdark', value: isdark).then((value) {
        emit(AppChangeDarkState());
      });
    }
  }

  Future getUserData() async
  {
    emit(SocialGetUserLoadingState());
    await FirebaseFirestore.instance.collection('users').
    doc(_uid).get()
        .then((value) {
      // print(value.data());
      usermodel = NewsUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
      throw error;
    });
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverimage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverimage = File(pickedFile.path);
      emit(SocialcoverimagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialcoverimagePickedErrorState());
    }
  }

  void UploadProfileImage
      ({
    required String name,
    required String phone,
    required String title,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //  emit(SocialuploadimageSuccessState());
        print(value);
        updataUser(name: name,
            phone: phone,
            bio: bio,
            image: value,
            title: title);
      }).catchError((error) {
        emit(SocialuploadimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadimageErrorState());
    });
  }

  void UploadcoverImage({
    required String name,
    required String phone,
    required String bio,
    required String title,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverimage!.path)
        .pathSegments
        .last}')
        .putFile(coverimage! as File)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialuploadcoverimageSuccessState());
        print(value);
        updataUser(name: name,
            phone: phone,
            bio: bio,
            cover: value,
            title: title);
      }).catchError((error) {
        emit(SocialuploadcoverimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadcoverimageErrorState());
    });
  }

  void updataUser({
    required String name,
    required String phone,
    required String bio,
    required String title,
    String? cover,
    String? image,
  }) {
    NewsUserModel model = NewsUserModel(
      name: name,
      phone: phone,
      bio: bio,
      shopping_address: title,
      email: usermodel!.email,
      cover: cover ?? usermodel!.cover!,
      image: image ?? usermodel!.image!,
      id: usermodel!.id,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users')
        .doc(model.id).update(model.toMap())
        .then((value) {
      getUserData();
      emit(SocialUserUpdateSuccessState());
    })
        .catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  int currentindex = 0;

  void changeindex(int index) {
    currentindex = index;
    emit(AppChangeBottomState());
  }

  List<dynamic>business = [];

  void getbusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'business',
      'apiKey': '6584f2f64a95406191467d518d4a4fe3',
    },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsgetbusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsgetbusinessErrorState(error.toString()));
    });
  }

  List<dynamic>sports = [];

  void getsports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsgetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetSportsErrorState(error.toString()));
      });
    }
    else {
      emit(NewsgetSportsSuccessState());
    }
  }

  List<dynamic>science = [];

  void getscience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsgetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsgetScienceSuccessState());
    }
  }

  List<dynamic>entertainment = [];
  void getentertainment() {
    emit(NewsGetentertainmentLoadingState());
    if (entertainment.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'entertainment',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        entertainment = value.data['articles'];
        print(entertainment[0]['title']);
        emit(NewsgetentertainmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetentertainmentErrorState(error.toString()));
      });
    } else {
      emit(NewsgetentertainmentSuccessState());
    }
  }

  List<dynamic>general = [];
  void getgeneral() {
    emit(NewsGetGeneralLoadingState());
    if (general.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'general',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        general = value.data['articles'];
        print(general[0]['title']);
        emit(NewsgetGeneralSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetGeneralErrorState(error.toString()));
      });
    } else {
      emit(NewsgetGeneralSuccessState());
    }
  }

  List<dynamic>health = [];
  void gethealth() {
    emit(NewsGetHealthLoadingState());
    if (health.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'health',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        health = value.data['articles'];
        print(health[0]['title']);
        emit(NewsgetHealthSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetHealthErrorState(error.toString()));
      });
    } else {
      emit(NewsgetHealthSuccessState());
    }
  }

  List<dynamic>technology = [];
  void gettecnology() {
    emit(NewsGettechnologyLoadingState());
    if (technology.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query:
      {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '6584f2f64a95406191467d518d4a4fe3',
      },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        technology = value.data['articles'];
        print(technology[0]['title']);
        emit(NewsgettechnologySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgettechnologyErrorState(error.toString()));
      });
    } else {
      emit(NewsgettechnologySuccessState());
    }
  }
  WeatherModel? weatherModel;
 Future<void> getWeather({required String cityName}) async{
    try {
      WeatherModel weatherModel=await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    }  catch (e) {
      emit(WeatherFailureState(
          e.toString()
      ));
    }
  }
  Future<void> getWeatherByLocation({required String location}) async{
    try {
      WeatherModel weatherModel=await WeatherServices(Dio()).getCurrentWeather(cityName: location);
      emit(WeatherLoadedState(weatherModel));
    }  catch (e) {
      emit(WeatherFailureState(
          e.toString()
      ));
    }
  }
}