import 'api_key.dart';

class TMDBEndpoints {
  static String movieList(String category) =>
      '$base_url/movie/$category?api_key=$api_key';
  static String movieWithParams(String category, String params) =>
      '$base_url/movie/$params/$category?api_key=$api_key';
  static String movieDetails(String movieId) =>
      '$base_url/movie/$movieId?api_key=$api_key';
}