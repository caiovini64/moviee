import 'package:flutter/material.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/image/image_widget.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class GridMoviesWidget extends StatelessWidget {
  final List<MovieEntity> list;
  final HomeController controller;
  final int rows;
  final int itemCounts;
  const GridMoviesWidget({
    required this.list,
    required this.controller,
    required this.rows,
    required this.itemCounts,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rows,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
                childAspectRatio: 14 / 9,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: itemCounts,
              itemBuilder: (context, index) {
                final movie = list[index];
                return GestureDetector(
                  onTap: () {
                    controller.setMovieSelected(movie);
                    controller.updatePageState(PageState.details);
                  },
                  child: Center(
                    child: Container(
                      height: constraints.maxHeight / 1,
                      child: ImageWidget(
                        heroKey: movie.id,
                        url: movie.posterPath,
                        imageQuality: 'w500',
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
