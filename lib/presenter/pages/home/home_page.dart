import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/helpers/helpers.dart';
import 'package:moviee/presenter/pages/home/components/children/children.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();
    return GetBuilder(
        init: controller,
        builder: (_) {
          return Obx(() {
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
  return ResponsiveBuilder(builder: (context, sizingInformation) {
    switch (sizingInformation.deviceScreenType) {
      case DeviceScreenType.desktop:
        return HomeDesktopPage(controller);
      case DeviceScreenType.tablet:
        return Container(color: Colors.black);
      default:
        return Container(color: Colors.blue);
    }
  });
}
