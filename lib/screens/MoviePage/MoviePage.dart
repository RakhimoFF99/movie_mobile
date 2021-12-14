import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height / 2.5,
                width: double.infinity,
                child: Container(
                  child: Image.network(
                    'https://fs.kinomania.ru/file/film_poster/7/bc/7bc915596e02e9450fb7f46c187cfdc4.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle_filled_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
