import 'package:flutter/material.dart';
import 'package:get/get.dart' as state;
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/components/image/image_widget.dart';
import 'package:moviee/presenter/helpers/helpers.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';
import 'package:moviee/presenter/pages/home/widgets/side_bar_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();
    return state.GetBuilder(
        init: controller,
        builder: (_) {
          return state.Obx(() {
            switch (controller.viewState) {
              case ViewState.loading:
                return CircularProgressIndicator();
              case ViewState.error:
                return CircularProgressIndicator();
              case ViewState.done:
                return buildPage(context, controller);
              default:
                return CircularProgressIndicator();
            }
          });
        });
  }
}

Widget buildPage(BuildContext context, HomeController controller) {
  return Scaffold(
    backgroundColor: Theme.of(context).backgroundColor,
    body: Row(
      children: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: [Condition.equals(name: DESKTOP)],
          child: SideBarWidget(),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: [Condition.equals(name: DESKTOP)],
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LimitedBox(
                  maxHeight: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final movie = controller.popularMoviesList[index];
                      return ImageWidget(
                        url: movie.posterPath,
                        imageQuality: 'w500',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
