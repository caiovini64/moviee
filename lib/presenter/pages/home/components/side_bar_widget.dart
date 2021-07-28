import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'desktop_widgets.dart';

class SideBarWidget extends StatefulWidget {
  final HomeController controller;
  const SideBarWidget({required this.controller});

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

  bool pageStateMovies() {
    if (widget.controller.pageState == PageState.nowPlaying ||
        widget.controller.pageState == PageState.topRated ||
        widget.controller.pageState == PageState.upcoming) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.controller.isSideBarOpen ? 265 : 80,
        child: Drawer(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: widget.controller.isSideBarOpen
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
                        widget.controller.isSideBarOpen
                            ? animationController.reverse()
                            : animationController.forward();
                      });
                      if (widget.controller.isMoviesCategoriesSelected) {
                        widget.controller.tapSideBar();
                        widget.controller.tapMovieCategories();
                      } else {
                        widget.controller.tapSideBar();
                      }
                    },
                  ),
                ),
                ButtonSideBar(
                  title: 'Home',
                  isIndex: widget.controller.pageState == PageState.home,
                  icon: Icons.home,
                  hasIcon: true,
                  onTap: () =>
                      widget.controller.updatePageState(PageState.home),
                  isOpen: widget.controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'Movies',
                  isIndex: pageStateMovies(),
                  icon: Icons.movie,
                  hasIcon: true,
                  suffix: Icon(Icons.arrow_drop_down, size: 20),
                  onTap: () {
                    if (widget.controller.isSideBarOpen) {
                      widget.controller.tapMovieCategories();
                      widget.controller.updatePageState(PageState.topRated);
                    } else {
                      widget.controller.tapMovieCategories();
                      widget.controller.updatePageState(PageState.topRated);
                      widget.controller.tapSideBar();
                    }
                  },
                  isOpen: widget.controller.isSideBarOpen,
                ),
                Visibility(
                  visible: widget.controller.isMoviesCategoriesSelected,
                  child: Column(
                    children: [
                      ButtonSideBar(
                        title: 'Top Rated',
                        isIndex:
                            widget.controller.pageState == PageState.topRated,
                        icon: Icons.favorite,
                        hasIcon: false,
                        onTap: () => widget.controller
                            .updatePageState(PageState.topRated),
                        isOpen: widget.controller.isSideBarOpen,
                        fontSize: 12,
                      ),
                      ButtonSideBar(
                        title: 'Up Coming',
                        isIndex:
                            widget.controller.pageState == PageState.upcoming,
                        icon: Icons.info,
                        hasIcon: false,
                        onTap: () => widget.controller
                            .updatePageState(PageState.upcoming),
                        isOpen: widget.controller.isSideBarOpen,
                        fontSize: 12,
                      ),
                      ButtonSideBar(
                        title: 'Now Playing',
                        isIndex:
                            widget.controller.pageState == PageState.nowPlaying,
                        icon: Icons.info,
                        hasIcon: false,
                        onTap: () => widget.controller
                            .updatePageState(PageState.nowPlaying),
                        isOpen: widget.controller.isSideBarOpen,
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
                ButtonSideBar(
                  title: 'Favorites',
                  isIndex: widget.controller.pageState == PageState.favorites,
                  icon: Icons.favorite,
                  hasIcon: true,
                  onTap: () =>
                      widget.controller.updatePageState(PageState.favorites),
                  isOpen: widget.controller.isSideBarOpen,
                ),
                ButtonSideBar(
                  title: 'About',
                  isIndex: widget.controller.pageState == PageState.info,
                  icon: Icons.info,
                  hasIcon: true,
                  onTap: () =>
                      widget.controller.updatePageState(PageState.info),
                  isOpen: widget.controller.isSideBarOpen,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
