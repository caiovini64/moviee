import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final String imageQuality;
  const ImageWidget({Key? key, required this.url, required this.imageQuality})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final urlPath = 'https://image.tmdb.org/t/p/' + imageQuality;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(
        image: NetworkImage(urlPath + url),
        fit: BoxFit.cover,
      ),
    );
  }
}
