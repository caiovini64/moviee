import 'package:flutter/material.dart';
import 'package:moviee/presenter/pages/home/components/widgets/button_side_bar_widget.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Just Move it',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
            ButtonSideBar(
              icon: Icons.home,
              title: 'Home',
              isIndex: true,
              onTap: () {},
            ),
            ButtonSideBar(
              icon: Icons.movie,
              title: 'Movies',
              isIndex: false,
              onTap: () {},
            ),
            ButtonSideBar(
              icon: Icons.favorite,
              title: 'Favorites',
              isIndex: false,
              onTap: () {},
            ),
            ButtonSideBar(
              icon: Icons.info,
              title: 'About',
              isIndex: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
