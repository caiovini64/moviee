import 'package:get/get.dart';
import 'package:moviee/presenter/pages/home/home_page.dart';
import 'package:moviee/presenter/pages/search/search_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
    ),
  ];
}
