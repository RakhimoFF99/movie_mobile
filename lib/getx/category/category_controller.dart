import 'package:get/get.dart';
import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Constants.dart';

class CategoryController extends GetxController {
  var categories = [].obs;

  @override
  onInit() {
    super.onInit();
    getAllCategories();
  }

  Future getAllCategories() async {
    http.Response response =
        await http.get(Uri.parse("${baseUrl}category/get"));
    var data = await jsonDecode(response.body);
    categories.value = data['categories'];
  }
}
