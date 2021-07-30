import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/external/datasources/authentication_datasource_impl.dart';
import 'package:moviee/infra/dependencies/injection_container.dart'
    as dependencies;
import 'package:moviee/presenter/helpers/helpers.dart';
import 'package:moviee/presenter/routes/app_pages.dart';

import 'presenter/pages/home/home_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  dependencies.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Just Movie it',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
