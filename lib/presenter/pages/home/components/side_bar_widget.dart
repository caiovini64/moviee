import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'desktop_widgets.dart';

class SideBarWidget extends StatefulWidget {
  @override
  _SideBarWidgetState createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  bool pageStateMovies(HomeController controller) {
    if (controller.pageState == PageState.nowPlaying ||
        controller.pageState == PageState.topRated ||
        controller.pageState == PageState.upcoming) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();

    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Obx(() {
            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: controller.isSideBarOpen ? 265 : 80,
              child: Drawer(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: controller.isSideBarOpen
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: IconButton(
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.menu_arrow,
                            progress: animationController,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              controller.isSideBarOpen
                                  ? animationController.reverse()
                                  : animationController.forward();
                            });
                            if (controller.isMoviesCategoriesSelected) {
                              controller.tapSideBar();
                              controller.tapMovieCategories();
                            } else {
                              controller.tapSideBar();
                            }
                          },
                        ),
                      ),
                      ButtonSideBar(
                        title: 'Home',
                        isIndex: controller.pageState == PageState.home,
                        icon: Icons.home,
                        hasIcon: true,
                        onTap: () => controller.updatePageState(PageState.home),
                        isOpen: controller.isSideBarOpen,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ButtonSideBar(
                          title: 'Movies',
                          isIndex: pageStateMovies(controller),
                          icon: Icons.movie,
                          hasIcon: true,
                          suffix: Icon(Icons.arrow_drop_down, size: 20),
                          onTap: () {
                            if (controller.isSideBarOpen) {
                              controller.tapMovieCategories();
                              controller.updatePageState(PageState.topRated);
                            } else {
                              controller.tapMovieCategories();
                              controller.updatePageState(PageState.topRated);
                              controller.tapSideBar();
                            }
                          },
                          isOpen: controller.isSideBarOpen,
                        ),
                      ),
                      Visibility(
                        visible: controller.isMoviesCategoriesSelected,
                        child: Column(
                          children: [
                            ButtonSideBar(
                              title: 'Top Rated',
                              isIndex:
                                  controller.pageState == PageState.topRated,
                              icon: Icons.favorite,
                              hasIcon: false,
                              onTap: () => controller
                                  .updatePageState(PageState.topRated),
                              isOpen: controller.isSideBarOpen,
                              fontSize: 12,
                            ),
                            ButtonSideBar(
                              title: 'Up Coming',
                              isIndex:
                                  controller.pageState == PageState.upcoming,
                              icon: Icons.info,
                              hasIcon: false,
                              onTap: () => controller
                                  .updatePageState(PageState.upcoming),
                              isOpen: controller.isSideBarOpen,
                              fontSize: 12,
                            ),
                            ButtonSideBar(
                              title: 'Now Playing',
                              isIndex:
                                  controller.pageState == PageState.nowPlaying,
                              icon: Icons.info,
                              hasIcon: false,
                              onTap: () => controller
                                  .updatePageState(PageState.nowPlaying),
                              isOpen: controller.isSideBarOpen,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                      ButtonSideBar(
                        title: 'Favorites',
                        isIndex: controller.pageState == PageState.favorites,
                        icon: Icons.favorite,
                        hasIcon: true,
                        onTap: () =>
                            controller.updatePageState(PageState.favorites),
                        isOpen: controller.isSideBarOpen,
                      ),
                      ButtonSideBar(
                        title: 'About',
                        isIndex: controller.pageState == PageState.info,
                        icon: Icons.info,
                        hasIcon: true,
                        onTap: () => controller.updatePageState(PageState.info),
                        isOpen: controller.isSideBarOpen,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
