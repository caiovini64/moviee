import 'package:flutter/material.dart';
import 'package:moviee/presenter/components/footer_widget.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SideBarWidget(controller: controller),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SearchBarWidget(),
                    ListMoviesWidget(
                      list: controller.popularMoviesList,
                      controller: controller,
                    ),
                    ListMoviesWidget(
                      list: controller.popularMoviesList,
                      controller: controller,
                    ),
                    // ListMoviesWidget(
                    //   list: controller.popularMoviesList,
                    //   controller: controller,
                    // ),
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
