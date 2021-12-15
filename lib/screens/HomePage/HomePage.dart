import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomePage/components/Category.dart';
import 'package:movie_app/screens/HomePage/components/movieCard.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/MoviePage/MoviePage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List pages = [home, play, personAccount];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pages[index](size, context),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: index == 0 ? Colors.white : Colors.blueGrey,
                      size: 25,
                    )),
                IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    icon: Icon(
                      Icons.play_circle_fill_outlined,
                      color: index == 1 ? Colors.white : Colors.blueGrey,
                      size: 25,
                    )),
                IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    icon: Icon(
                      Icons.person,
                      color: index == 2 ? Colors.white : Colors.blueGrey,
                      size: 25,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget home(size, context) {
  print(home);
  return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height / 13,
          ),
          Row(
            children: [
              Text(
                "Stream",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Everywhere",
                style: TextStyle(
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Hero(
                tag: 0,
                child: Container(
                  height: size.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://fs.kinomania.ru/file/film_poster/7/bc/7bc915596e02e9450fb7f46c187cfdc4.jpeg',
                          ))),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 30,
                child: Container(
                    width: size.width / 2.5,
                    height: size.height / 15,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 2.0,
                          sigmaX: 2.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(MoviePage(
                              index: 0,
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_filled_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width / 4,
                                  child: Text(
                                    "Insidious 3",
                                    style: TextStyle(
                                      fontSize: size.width / 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white70.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    )),
              )
            ],
          )
        ],
      ));
}

Widget play(size, context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          width: size.width / 2,
          child: Text(
            'Find Movies, Tv series, and more...',
            style: TextStyle(
                fontSize: size.width / 22,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: size.width / 1.15,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff211F30)),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: size.width / 18,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Sherlock Holmes",
                hintStyle: TextStyle(color: Color(0xff6E6D76)),
                labelStyle: TextStyle(),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Category(),
        Container(
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                childAspectRatio: 0.5,
                crossAxisSpacing: 10,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.to(MoviePage(
                        index: index,
                      ));
                    },
                    child: Column(
                      children: [
                        MovieCard(
                          index: index,
                        ),
                      ],
                    ));
              }),
        ),
      ],
    ),
  );
}

Widget personAccount(size, context) {
  return Container();
}
