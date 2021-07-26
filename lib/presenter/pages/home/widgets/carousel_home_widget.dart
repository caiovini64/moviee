import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/components.dart';

class CarouselHomeWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  const CarouselHomeWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, itemIndex, pageIndex) {
          return Card(
            child: ImageWidget(
              url: movies[itemIndex].backdropPath,
              imageQuality: 'original',
            ),
          );
        },
        options: CarouselOptions(
          height: 480,
          viewportFraction: 1,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
