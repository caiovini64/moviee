import 'package:flutter/material.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/components.dart';
import 'package:moviee/presenter/pages/home/components/list_movies_widget.dart';

class DetailsWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  final MovieEntity movieSelected;
  final List<MovieEntity> listRecommendedMovies;
  const DetailsWidget({
    Key? key,
    required this.movieDetails,
    required this.movieSelected,
    required this.listRecommendedMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxHeight);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Center(
                        child: ImageWidget(
                          heroKey: movieSelected.id,
                          url: movieSelected.backdropPath,
                          imageQuality: 'original',
                        ),
                      ),
                    ),
                  ],
                ),
                // GridMoviesWidget(list: list, controller: controller)
              ],
            ),
          );
        },
      ),
    );
  }
}
