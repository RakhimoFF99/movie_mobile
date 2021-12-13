import 'package:flutter/material.dart';
class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 2.5,
            child: Container(
              child: Image.network('https://avatars.mds.yandex.net/i?id=9ba9a9801159335fa30e97ea2952d4c0-5318189-images-thumbs&n=13'),
            ),
          )
        ],
      ),
    );
  }
}
