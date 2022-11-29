import 'dart:convert';
import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:imaginamos_test/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:imaginamos_test/models/movie_detail.dart';

class MovieController extends GetxController {
  List<Movie>? movies = [];
  List<Movie>? moviesTopRated = [];
  MovieDetail movieDetail = MovieDetail();

  var isDataLoading = false.obs;

  @override
  void onInit() {
    getMovies();
    getMoviesTopRated();
  }

  void getMovies() async {
    String apiKey = 'b3614c94f521c384ac8444f1f465136b';

    try {
      isDataLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=1')!);
      if (response.statusCode == 200) {
        ///data successfully

        var data = jsonDecode(response.body);

        for (Map<String, dynamic> movie in data['results'] as List) {
          movies!.add(Movie.fromJson(movie));
        }
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  void getMoviesTopRated() async {
    String apiKey = 'b3614c94f521c384ac8444f1f465136b';

    try {
      isDataLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=${apiKey}&language=en-US&page=1')!);
      if (response.statusCode == 200) {
        ///data successfully

        var data = jsonDecode(response.body);

        for (Map<String, dynamic> movie in data['results'] as List) {
          moviesTopRated!.add(Movie.fromJson(movie));
        }
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  void getMovieDetail(int id) async {
    String apiKey = 'b3614c94f521c384ac8444f1f465136b';

    try {
      isDataLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          '  https://api.themoviedb.org/3/movie/${id}?api_key=${apiKey}&language=es')!);
      if (response.statusCode == 200) {
        ///data successfully

        var data = jsonDecode(response.body);

        movieDetail = MovieDetail.fromJson(data);
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
