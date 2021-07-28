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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SearchBarWidget(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.account_circle),
                          ),
                        ],
                      ),
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
