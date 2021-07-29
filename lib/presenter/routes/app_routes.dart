import 'package:moviee/presenter/pages/details/details_page.dart';
import 'package:moviee/presenter/pages/home/home_page.dart';
import 'package:moviee/presenter/pages/search/search_page.dart';

abstract class Routes {
  static const HOME = HomePage.route;
  static const SEARCH = SearchPage.route;
  static const DETAILS = DetailsPage.route;
}
