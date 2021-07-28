import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'desktop_widgets.dart';

class SideBarWidget extends StatelessWidget {
  final HomeController controller;
  const SideBarWidget({required this.controller});

  bool pageStateMovies() {
    if (controller.pageState == PageState.nowPlaying ||
        controller.pageState == PageState.topRated ||
        controller.pageState == PageState.upcoming) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: controller.isSideBarOpen ? 265 : 100,
        child: Drawer(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: controller.isSideBarOpen
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => controller.tapSideBar(),
                ),
                ButtonSideBar(
                  title: 'Home',
                  isIndex: controller.pageState == PageState.home,
                  icon: Icons.home,
                  onTap: () => controller.updatePageState(PageState.home),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'Movies',
                  isIndex: pageStateMovies(),
                  icon: Icons.movie,
                  onTap: () => controller.updatePageState(PageState.topRated),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'Favorites',
                  isIndex: controller.pageState == PageState.favorites,
                  icon: Icons.favorite,
                  onTap: () => controller.updatePageState(PageState.favorites),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'About',
                  isIndex: controller.pageState == PageState.info,
                  icon: Icons.info,
                  onTap: () => controller.updatePageState(PageState.info),
                  isOpen: controller.isSideBarOpen,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
