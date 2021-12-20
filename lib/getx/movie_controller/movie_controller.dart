import 'dart:convert';

import 'package:get/state_manager.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/Constants.dart';

class MovieController extends GetxController {
  var movies = [].obs;
  var isMovieLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllMovie();
  }

  Future getAllMovie() async {
    isMovieLoaded.value = false;
    print('ssdsd');
    try {
      http.Response response = await http.get(Uri.parse("${baseUrl}movie/all"));

      var data = await jsonDecode(response.body);
      print(data);
      movies.value = data['movies'];
      isMovieLoaded.value = true;
    }
    catch(e) {
      print(e);
    }

  }

  Future getMovieByCategory(categoryId) async {}
}
