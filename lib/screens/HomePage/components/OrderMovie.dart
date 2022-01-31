import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movie_app/Constants.dart';
import 'package:http/http.dart' as http;

class OrderMovie extends StatefulWidget {
  const OrderMovie({Key? key}) : super(key: key);

  @override
  _OrderMovieState createState() => _OrderMovieState();
}

class _OrderMovieState extends State<OrderMovie> {
  TextEditingController _movieController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.3,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "Заказать фильм",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: inputBg, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: _movieController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: InputBorder.none,
                  hintText: 'Названия фильма',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w400, color: hintColor)),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: inputBg, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: _genreController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: InputBorder.none,
                  hintText: 'Жанр фильма',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w400, color: hintColor)),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    new TextEditingController().clear();
                    if (_movieController.text.length > 0 &&
                        _genreController.text.length > 0) {
                      sendOrder(context);
                    } else {
                      EasyLoading.showError('Пожалуйста заполните все поля');
                    }
                  },
                  child: Text("Добавить заказ")))
        ],
      ),
    );
  }

  notifyClient(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey[800],
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                    new TextEditingController().clear();
                  },
                  child: Text(
                    'Закрыть',
                  ))
            ],
            title: Text("Ваш заказ был принят скором времени будет добавлено",
                style: TextStyle(fontWeight: FontWeight.w800)),
            elevation: 5,
          );
        });
  }

  Future sendOrder(context) async {
    EasyLoading.show();
    Map order = {"name": _movieController.text, "genre": _genreController.text};
    try {
      http.Response response =
          await http.post(Uri.parse("$baseUrl/order/add"), body: order);
      var data = await jsonDecode(response.body);
      if (data['success']) {
        setState(() {
          _movieController.text = "";
          _genreController.text = "";
          EasyLoading.dismiss();
          notifyClient(context);
        });
      }
    } catch (e) {
      EasyLoading.showError("Что-то пошло не так попробуйте позже");
    }
  }
}
