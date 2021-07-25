import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart'
    as dependencies;
import 'package:moviee/presenter/routes/app_pages.dart';
import 'package:moviee/presenter/routes/app_routes.dart';

import 'presenter/pages/home/home_page.dart';

void main() {
  dependencies.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Just Movie it',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
