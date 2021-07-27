import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 80, right: 80),
      color: Colors.black.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Powered by',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 3),
              Image.asset(
                'logos/tmdb-logo.png',
                height: 10,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          Text(
            'Just Movie it',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: LineIcon.googlePlay(size: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: LineIcon.github(),
              ),
              IconButton(
                onPressed: () {},
                icon: LineIcon.linkedin(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
