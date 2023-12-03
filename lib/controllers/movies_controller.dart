import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/videos_model.dart';
class MoviesController extends ChangeNotifier{
  String _apiKey = '492a2a073871d91c7722b32f672d2e35';
  List<MovieModel> moviesList = [];
  MovieDetailsModel? selectedMovieDetailsModel;
  MovieVideoModel? selectedMovieVideoModel;
  bool isExecuted = false;
  List<CategoryModel> movieCategories = [
    CategoryModel(name: 'Comedies', image:'assets/images/1.png'),
    CategoryModel(name: 'Crime', image: 'assets/images/2.png'),
    CategoryModel(name: 'Family', image: 'assets/images/3.png'),
    CategoryModel(name: 'Documentaries', image: 'assets/images/4.png'),
    CategoryModel(name: 'Dramas', image: 'assets/images/5.png'),
    CategoryModel(name: 'Fantasy', image: 'assets/images/9.png'),
    CategoryModel(name: 'Holidays', image: 'assets/images/10.png'),
    CategoryModel(name: 'Horror', image: 'assets/images/6.png'),
    CategoryModel(name: 'Sci-Fi', image: 'assets/images/8.png'),
    CategoryModel(name: 'Thriller', image:'assets/images/7.png'),
  ];

  getMoviesList() async {
        try{
          if(!isExecuted){
            print('Called');
            isExecuted=true;
            var request = http.Request('GET', Uri.parse('$TMDB_BASE_URL/3/movie/upcoming?api_key=$_apiKey'));
            http.StreamedResponse response = await request.send();
            if (response.statusCode == 200) {
              print(response.statusCode);
              final Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
              final List<dynamic> results = data['results'];
              moviesList = results.map((json) => MovieModel.fromJson(json)).toList();
              print(moviesList);
              notifyListeners();
            } else {
              print(response.reasonPhrase);
            }
          }
        }
        catch(e){
          print(e.toString());
        }
  }

 Future<void> getMovieDetails(int movieId)async{
    try{
      var request = http.Request('GET', Uri.parse('$TMDB_BASE_URL/3/movie/$movieId?api_key=$_apiKey'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(response.statusCode);
        final Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
        MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson(data);
        selectedMovieDetailsModel = movieDetailsModel;
        notifyListeners();
      }
      else {
        print(response.reasonPhrase);
      }

    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> getMovieVideos(int movieId)async{
    var request = http.Request('GET', Uri.parse('$TMDB_BASE_URL/3/movie/$movieId/videos?api_key=$_apiKey'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(response.statusCode);
      final Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
      MovieVideoModel movieVideoModel = MovieVideoModel.fromJson(data);
      selectedMovieVideoModel = movieVideoModel;
      notifyListeners();
    }
    else {
      print(response.reasonPhrase);
    }

  }

  static String buildPosterUrl(String posterPath) {
    const String baseUrl = 'https://image.tmdb.org/t/p/';
    const String posterSize = 'w500';
    return '$baseUrl$posterSize$posterPath';
  }

  String formatReleaseDate(String inputDate) {
    DateTime parsedDate = DateTime.parse(inputDate);
    final outputFormat = DateFormat('MMMM d, y');
    String formattedDate = outputFormat.format(parsedDate);
    return formattedDate;
  }



}