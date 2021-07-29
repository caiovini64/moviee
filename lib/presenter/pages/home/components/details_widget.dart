import 'package:flutter/material.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/presenter/components/components.dart';

class DetailsWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  final MovieEntity movieSelected;
  const DetailsWidget({
    Key? key,
    required this.movieDetails,
    required this.movieSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: ImageWidget(
          heroKey: movieSelected.id,
          url: movieSelected.posterPath,
          imageQuality: 'original',
        ),
      ),
    );
  }
}
