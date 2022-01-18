import 'dart:convert';

import 'package:flutter/material.dart';
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
      height: size.height/1.3,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text("Заказать фильм",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
                color: inputBg,
                borderRadius: BorderRadius.circular(15)
            ),
            child: TextField(
              controller: _movieController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  border: InputBorder.none,
                  hintText: 'Названия фильма',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 15,),

          Container(
            decoration: BoxDecoration(
                color: inputBg,
                borderRadius: BorderRadius.circular(15)
            ),
            child: TextField(
              controller: _genreController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  border: InputBorder.none,
                  hintText: 'Жанр фильма',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),

          SizedBox(height: 25,),

          Center(
              child: ElevatedButton(

                  onPressed: () {
                    sendOrder();
                  },
                  child: Text("Добавить заказ")))
        ],
      ),
    );
  }

 Future sendOrder () async{
    Map order = {
      "name":_movieController.text,
      "genre":_genreController.text
    };
      try {
          http.Response response = await http.post(Uri.parse("$baseUrl1/order/add"),body:order );
          var data = await jsonDecode(response.body);
          if(data['success']) {
            setState(() {
              _movieController.text = "";
              _genreController.text = "";
            });

          }
      }
      catch(e) {
        print(e);
      }
  }
}
