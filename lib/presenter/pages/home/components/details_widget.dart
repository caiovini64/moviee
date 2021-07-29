import 'package:flutter/material.dart';
import 'package:moviee/presenter/components/components.dart';
import 'package:moviee/presenter/pages/home/components/list_movies_widget.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class DetailsWidget extends StatelessWidget {
  final HomeController controller;
  const DetailsWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Visibility(
                        visible:
                            controller.movieSelectedDetails.backdropPath != '',
                        child: Center(
                          child: ImageWidget(
                            heroKey: controller.movieSelectedDetails.id,
                            url: controller.movieSelectedDetails.backdropPath,
                            imageQuality: 'original',
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: constraints.maxHeight * 0.6,
                        width: constraints.maxWidth * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.movieSelectedDetails.title,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Container(
                              height: 30,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .movieSelectedDetails.genres.length,
                                itemBuilder: (context, index) {
                                  final genre = controller
                                      .movieSelectedDetails.genres[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      genre.name,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              controller.movieSelectedDetails.description,
                              style: Theme.of(context).textTheme.headline3,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GridMoviesWidget(
                  list: controller.recommendedMoviesList,
                  controller: controller,
                  rows: 1,
                  itemCounts: controller.recommendedMoviesList.length,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
