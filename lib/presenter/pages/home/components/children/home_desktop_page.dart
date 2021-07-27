import 'package:flutter/material.dart';
import 'package:moviee/presenter/pages/home/components/widgets/side_bar_widget.dart';
import 'package:moviee/presenter/pages/home/components/widgets/widgets.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class HomeDesktopPage extends StatelessWidget {
  final HomeController controller;
  const HomeDesktopPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Row(
        children: [
          SideBarWidget(controller: controller),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SearchBarWidget(),
              ListMoviesWidget(controller.popularMoviesList),
              ListMoviesWidget(controller.popularMoviesList),
            ],
          ),
        ],
      ),
    );
  }
}
