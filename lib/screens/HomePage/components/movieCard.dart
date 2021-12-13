import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final data;
  MovieCard({this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.network(
            'https://avatars.mds.yandex.net/i?id=e157550c2736f574c60fc9fe36e0581a-3527582-images-thumbs&n=13',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(
            "Soul 2020",
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
