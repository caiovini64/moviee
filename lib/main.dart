import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart'
    as dependencies;
import 'package:moviee/presenter/helpers/helpers.dart';
import 'package:moviee/presenter/routes/app_pages.dart';
import 'package:moviee/presenter/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presenter/pages/home/home_page.dart';

void main() {
  dependencies.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) {
        return ResponsiveWrapper.builder(widget,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(
              color: appTheme().backgroundColor,
            ));
      },
      title: 'Just Movie it',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
