import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final String imageQuality;
  final int heroKey;
  const ImageWidget({
    Key? key,
    required this.url,
    required this.imageQuality,
    required this.heroKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final urlPath = 'https://image.tmdb.org/t/p/' + imageQuality;

    return Hero(
      tag: heroKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: NetworkImage(urlPath + url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
