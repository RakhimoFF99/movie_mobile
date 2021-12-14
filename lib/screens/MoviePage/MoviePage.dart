import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Star Wars: The Last jedi",
                  style: TextStyle(
                    fontSize: size.width / 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.white70,
                      size: size.width / 22,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '152',
                      style: TextStyle(
                        fontSize: size.width / 28,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "minutes",
                      style: TextStyle(
                          color: Colors.white70, fontSize: size.width / 30),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.star,
                      size: size.width / 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("7.0  (IMDb)")
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(color: Color(0xff515151)),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Release date",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.width / 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'December 9,2017',
                          style: TextStyle(
                              color: Colors.white70, fontSize: size.width / 30),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width / 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genre",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.width / 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(color: Color(0xff515151)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: size.width / 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
