import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants.dart';
import 'package:movie_app/getx/movie_controller/movie_controller.dart';
import 'package:movie_app/screens/HomePage/components/Category.dart';
import 'package:movie_app/screens/HomePage/components/OrderMovie.dart';
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
  var movieController = Get.put(MovieController());
  int index = 0;
  List pages = [home, play, personAccount];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
          child: GetX<MovieController>(
            init: MovieController(),
            builder: (controller) {
              if (controller.isMovieLoaded.isTrue) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pages[index](size, context, movieController),
                  ],
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
      bottomNavigationBar: Container(
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: index == 0 ? Colors.red : Colors.white,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle_fill_outlined,
                    color: index == 1 ? Colors.red : Colors.white,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt_outlined,
                    color: index == 2 ? Colors.red : Colors.white,
                  ),
                  label: "")
            ],
          )),
    );
  }
}

Widget home(size, context, movieController) {
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
                child: GetX<MovieController>(
                  init: MovieController(),
                  builder: (controller) {
                    return Container(
                      height: size.height / 3.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                controller.movies[8]['mainImagePath'],
                              ))),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 15,
                left: 30,
                child: GetX<MovieController>(
                  init: MovieController(),
                  builder: (controller) {
                    return Container(
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
                                  data: controller.movies[8],
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
                                        controller.movies[8]['name'],
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
                                    color: Colors.black54.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              )
            ],
          ),

        SizedBox(height: 25,),
          GetX<MovieController>(
            init: MovieController(),
            builder: (controller) {
              return CarouselSlider(
                options: CarouselOptions(
                    height: size.height/2.35,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1200),
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,

                ),
                items: controller.movies.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePage(index: i['_id'],data: i,)));
                        },
                        child: Hero(
                          tag: i['_id'],
                          child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image:DecorationImage(
                                    fit: BoxFit.fill,
                                    image:   NetworkImage(i['mainImagePath'])
                                  )

                              ),

                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          )
        ],
      ));
}

Widget play(size, context, movieController) {
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
        GetX<MovieController>(
            init: MovieController(),
            builder: (controller) {
              return Container(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: size.height * 0.000750,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.to(MoviePage(
                              index: index,
                              data: controller.movies[index],
                            ));
                          },
                          child: Column(
                            children: [
                              MovieCard(
                                index: index,
                                data: controller.movies[index],
                              ),
                            ],
                          ));
                    }),
              );
            }),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget personAccount(size, context, movieController) {

  return Container(
    child: OrderMovie(),
  );
}
