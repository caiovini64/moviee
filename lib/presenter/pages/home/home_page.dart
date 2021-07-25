import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';
import 'package:moviee/presenter/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();
    return GetBuilder(
      init: controller,
      builder: (_) => Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
