import 'package:flutter/material.dart';
//Named as a route because have a conflict name with responsive framework
import 'package:get/get.dart' as route;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import 'item_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.smallerThan(name: TABLET)],
      child: AppBar(
        title: Text('Just Movie it'),
      ),
      replacement: Container(
        height: 400,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemAppBar(
              title: 'Home',
              onTap: () {},
            ),
            ItemAppBar(
              title: 'About',
              onTap: () {},
            ),
            ItemAppBar(
              title: 'Discover',
              onTap: () {},
            ),
            ItemAppBar(
              title: 'Movies',
              onTap: () {},
            ),
            IconButton(
              onPressed: () => route.Get.toNamed('/search'),
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
