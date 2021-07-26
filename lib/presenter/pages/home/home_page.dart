import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/components/components.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'widgets/widgets.dart';

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
