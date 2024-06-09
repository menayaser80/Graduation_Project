

import 'package:newsapp_weather_graduation/models/WeatherModel.dart';

abstract class NewsStates{}
class SocialInitialState extends NewsStates{}
class SocialGetUserLoadingState extends NewsStates{}
class SocialGetUserSuccessState extends NewsStates{}
class SocialGetUserErrorState extends NewsStates{
  final String error;
  SocialGetUserErrorState(this.error);
}
class SocialUserUpdateLoadingState extends NewsStates{}
class SocialProfileImagePickedSuccessState extends NewsStates{}
class SocialProfileImagePickedErrorState extends NewsStates{}
class SocialcoverimagePickedSuccessState extends NewsStates{}
class SocialcoverimagePickedErrorState extends NewsStates{}

class SocialuploadimageErrorState extends NewsStates{}
class SocialUserUpdateErrorState extends NewsStates{}
class SocialuploadcoverimageErrorState extends NewsStates{}
class AppChangeDarkState extends NewsStates{}
class AppChangeBottomState extends NewsStates{}
class SocialUserUpdateSuccessState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsgetScienceSuccessState extends NewsStates
{}
class NewsgetScienceErrorState extends NewsStates
{
  late final String error;
  NewsgetScienceErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsgetSportsSuccessState extends NewsStates
{}
class NewsgetSportsErrorState extends NewsStates
{
  late final String error;
  NewsgetSportsErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsgetbusinessSuccessState extends NewsStates
{}
class NewsgetbusinessErrorState extends NewsStates
{
  late final String error;
  NewsgetbusinessErrorState(this.error);
}
class NewsGetentertainmentLoadingState extends NewsStates{}
class NewsgetentertainmentSuccessState extends NewsStates
{}
class NewsgetentertainmentErrorState extends NewsStates
{
  late final String error;
  NewsgetentertainmentErrorState(this.error);
}
class NewsGetGeneralLoadingState extends NewsStates{}
class NewsgetGeneralSuccessState extends NewsStates
{}
class NewsgetGeneralErrorState extends NewsStates
{
  late final String error;
  NewsgetGeneralErrorState(this.error);
}
class NewsGetHealthLoadingState extends NewsStates{}
class NewsgetHealthSuccessState extends NewsStates
{}
class NewsgetHealthErrorState extends NewsStates
{
  late final String error;
  NewsgetHealthErrorState(this.error);
}
class NewsGettechnologyLoadingState extends NewsStates{}
class NewsgettechnologySuccessState extends NewsStates
{}
class NewsgettechnologyErrorState extends NewsStates
{
  late final String error;
  NewsgettechnologyErrorState(this.error);
}
class WeatherLoadedState extends NewsStates{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends NewsStates{
  final String errMessage;

  WeatherFailureState(this.errMessage);
}

