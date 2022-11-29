import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imaginamos_test/controllers/movie_controller.dart';
import 'package:imaginamos_test/models/movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    TextStyle titleStyle = const TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600);

    MovieController movieController = Get.put(MovieController());

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screen.height * 0.33,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(92, 161, 212, 1)),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              width: 20,
              height: screen.height * 0.05,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Hello,what do you', style: titleStyle),
                  Text('want to watch ?', style: titleStyle),
                  SizedBox(height: screen.height * 0.03),
                  Container(
                      width: screen.width * 0.8,
                      height: screen.height * 0.05,
                      alignment: Alignment.center,
                      child: const SearchTextField())
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screen.height * 0.7,
            margin: EdgeInsets.only(top: screen.height * 0.28),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(40, 53, 70, 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('RECOMMENDED FOR YOU',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      TextButton(
                          onPressed: () => print('See all'),
                          child: Text('See all',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)))
                    ],
                  ),
                ),
                Expanded(
                    child: Obx(() => ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: !movieController.isDataLoading.value
                            ? movieController.movies!.length
                            : 0,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {},
                              child: MovieItem(
                                  movie:
                                      movieController.movies!.elementAt(index)),
                            ))))),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('TOP RATED',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      TextButton(
                          onPressed: () => print('See all'),
                          child: Text('See all',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)))
                    ],
                  ),
                ),
                Expanded(
                    child: Obx(() => ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: !movieController.isDataLoading.value
                            ? movieController.moviesTopRated!.length
                            : 0,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {},
                              child: MovieItem(
                                  movie: movieController.moviesTopRated!
                                      .elementAt(index)),
                            ))))),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      width: screen.width * 0.26,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}')),
          Text(movie.originalTitle!,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorPrimary = const Color.fromRGBO(142, 190, 225, 1);
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: Color.fromARGB(255, 178, 206, 226)),
        contentPadding: const EdgeInsets.all(0),
        filled: true,
        fillColor: colorPrimary,
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: colorPrimary,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: colorPrimary,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
