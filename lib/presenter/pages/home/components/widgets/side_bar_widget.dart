import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/presenter/pages/home/components/widgets/button_side_bar_widget.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class SideBarWidget extends StatelessWidget {
  final HomeController controller;
  const SideBarWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: controller.isSideBarOpen ? 300 : 100,
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
                  isIndex: true,
                  icon: Icons.home,
                  onTap: () => print('home'),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'Movies',
                  isIndex: false,
                  icon: Icons.movie,
                  onTap: () => print('movies'),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'Favorites',
                  isIndex: false,
                  icon: Icons.favorite,
                  onTap: () => print('Favorites'),
                  isOpen: controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'About',
                  isIndex: false,
                  icon: Icons.info,
                  onTap: () => print('About'),
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
