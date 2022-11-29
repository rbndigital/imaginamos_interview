import 'package:flutter/material.dart';
import 'package:imaginamos_test/controllers/movie_controller.dart';
import 'package:get/get.dart';
import 'package:imaginamos_test/models/movie_detail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int? idMovie = arguments['idMovie'];

    MovieController movieController = Get.put(MovieController());

    movieController.getMovieDetail(idMovie!);

    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
            child:
                Obx(() => Text(movieController.movieDetail.originalTitle!))));
  }
}
