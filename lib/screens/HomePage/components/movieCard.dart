import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final data;
  final index;
  MovieCard({this.data, this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Hero(
          tag: index,
          child: Container(
              height: size.height / 3.5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://fs.kinomania.ru/file/film_poster/7/bc/7bc915596e02e9450fb7f46c187cfdc4.jpeg',
                    )),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Text(
            "Insidious 3",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: size.width / 25),
          ),
        ),
      ],
    );
  }
}
