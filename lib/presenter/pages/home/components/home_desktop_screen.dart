import 'package:flutter/material.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'widgets.dart';

class HomeDesktopScreen extends StatelessWidget {
  final HomeController controller;
  const HomeDesktopScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SideBarWidget(controller: controller),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SearchBarWidget(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.umbrella),
                        ),
                      ],
                    ),
                    GridMoviesWidget(
                      list: controller.popularMoviesList,
                      controller: controller,
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
