import 'dart:convert';

import 'package:get/state_manager.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/Constants.dart';

class MovieController extends GetxController {
  var movies = [].obs;
  var randomMovies = [].obs;

  var isMovieLoaded = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRandomMovie();
    getAllMovie();
  }

  Future<void> getAllMovie() async {
    isMovieLoaded.value = false;

    try {
      http.Response response = await http.get(Uri.parse("${baseUrl}movie/all"));

      var data = await jsonDecode(response.body);
      print(data);
      movies.value = data['movies'];
      isMovieLoaded.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future getAllMoviesByCategory() async {
    isLoading.value = true;
    try {
      http.Response response = await http.get(Uri.parse("${baseUrl}movie/all"));
      var data = await jsonDecode(response.body);
      movies.value = data['movies'];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> getMovieByCategory(String id) async {
    isLoading.value = true;
    try {
      http.Response response =
          await http.get(Uri.parse("${baseUrl}movie/getByCategory/$id"));

      var data = await jsonDecode(response.body);
      movies.value = data['movies'];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> searchMovieByInput(String value) async {
    try {
      http.Response response =
          await http.get(Uri.parse("${baseUrl}movie/search?search=$value"));
      var data = await jsonDecode(response.body);
      movies.value = data['movies'];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRandomMovie() async {
    try {
      http.Response response =
          await http.get(Uri.parse("${baseUrl}movie/random"));
      var data = await jsonDecode(response.body);
      print("random $data");
      randomMovies.value = data['movies'];
    } catch (e) {
      print(e);
    }
  }
}
