import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/pages/home/components/details_widget.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'widgets.dart';

class HomeDesktopScreen extends StatelessWidget {
  final HomeController controller;
  const HomeDesktopScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();

    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SideBarWidget(),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildSinglePage(),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
          bottomNavigationBar: FooterWidget(),
        );
      },
    );
  }

  Widget buildSinglePage() {
    return Obx(() {
      switch (controller.pageState) {
        case PageState.home:
          return GridMoviesWidget(
            list: controller.moviesList.toList(),
            controller: controller,
            rows: 2,
            itemCounts: controller.moviesList.length,
          );
        case PageState.info:
          return GridMoviesWidget(
            list: controller.moviesList.toList(),
            controller: controller,
            rows: 2,
            itemCounts: 12,
          );
        case PageState.favorites:
          return GridMoviesWidget(
            list: controller.moviesList.toList(),
            controller: controller,
            rows: 2,
            itemCounts: 12,
          );
        case PageState.details:
          return DetailsWidget(controller: controller);
        default:
          return GridMoviesWidget(
            list: controller.moviesList.toList(),
            controller: controller,
            rows: 2,
            itemCounts: 12,
          );
      }
    });
  }
}
