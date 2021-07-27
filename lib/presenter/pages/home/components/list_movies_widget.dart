import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/image/image_widget.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class ListMoviesWidget extends StatelessWidget {
  final List<MovieEntity> list;
  final HomeController controller;
  const ListMoviesWidget({required this.list, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                final movie = list[index];
                return Center(
                  child: Container(
                    width: constraints.maxWidth / 6,
                    child: AspectRatio(
                      aspectRatio: 0.7,
                      child: ImageWidget(
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
