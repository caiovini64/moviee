import 'package:flutter/material.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/image/image_widget.dart';

class ListMoviesWidget extends StatelessWidget {
  final List<MovieEntity> list;
  const ListMoviesWidget(
    this.list,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LimitedBox(
            maxHeight: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
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
  }
}
