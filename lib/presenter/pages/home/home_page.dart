import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();
    return GetBuilder(
      init: controller,
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Row(
          children: [
            responsive.ResponsiveVisibility(
              visible: false,
              visibleWhen: [
                responsive.Condition.equals(name: responsive.DESKTOP)
              ],
              child: Drawer(),
            ),
            Expanded(child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
