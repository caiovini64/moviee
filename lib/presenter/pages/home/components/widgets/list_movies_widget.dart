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
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: controller.isSideBarOpen ? 280 : 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  final movie = list[index];
                  return ImageWidget(
                    url: movie.posterPath,
                    imageQuality: 'w500',
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
