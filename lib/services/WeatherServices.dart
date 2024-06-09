import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:newsapp_weather_graduation/models/WeatherModel.dart';

class WeatherServices{
  final Dio dio;
  final String baseUrl='http://api.weatherapi.com/v1';
  final String apiKey='18b1079c6cb24f7da06174405242302';
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName})async
  {
    try {
      Response response=await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel=WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errMessage);
    }catch(e){
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }
  }
  Future<WeatherModel> getCurrentWeatherByLocation({required String location})async
  {
    try {
      Response response=await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$location&days=1');
      WeatherModel weatherModel=WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errMessage);
    }catch(e){
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }
  }

// Future<WeatherModel> getForeCast({required String cityName})async {
//   Response response=await dio.get(
//       '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
//   WeatherModel weatherModel=WeatherModel.fromJson(response.data);
//   return weatherModel;
// }

}