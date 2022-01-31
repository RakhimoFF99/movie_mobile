import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/getx/category/category_controller.dart';
import 'package:movie_app/getx/movie_controller/movie_controller.dart';
import 'package:movie_app/screens/HomePage/components/Category.dart';
import 'package:movie_app/screens/HomePage/components/OrderMovie.dart';
import 'package:movie_app/screens/HomePage/components/movieCard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/MoviePage/MoviePage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var categoryController = Get.put(CategoryController());
  var movieController = Get.put(MovieController());
  int index = 0;
  int activeMovieIndex = 0;

  bool activeMovieSet = true;
  List pages = [home, play, personAccount];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetX<MovieController>(
        init: MovieController(),
        builder: (controller) {
          if (controller.isMovieLoaded.isTrue) {
            if (activeMovieSet) {
              activeMovieIndex =
                  new Random().nextInt(controller.randomMovies.length);
              activeMovieSet = false;
            }
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("assets/bg.jpg"))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pages[index](
                        size, context, movieController, activeMovieIndex),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: size.height,
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
        },
      ),
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

Widget home(size, context, movieController, activeMovieIndex) {
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
                "Emovie",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Stream",
                style: TextStyle(
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w700,
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
                tag: activeMovieIndex.toString,
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
                                controller.randomMovies[activeMovieIndex]
                                    ['mainImagePath'],
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
                        height: 40,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 2.0,
                              sigmaX: 2.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(MoviePage(
                                  data:
                                      controller.randomMovies[activeMovieIndex],
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
                                        controller
                                                .randomMovies[activeMovieIndex]
                                            ['name'],
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
                                    color: Colors.blueGrey.withOpacity(0.5),
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
          SizedBox(
            height: 25,
          ),
          GetX<MovieController>(
            init: MovieController(),
            builder: (controller) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: size.height / 2.35,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 1200),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: controller.randomMovies.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(
                                        data: i,
                                      )));
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(i['mainImagePath']))),
                            ),
                            Positioned(
                              bottom: 10,
                              left: size.width / 10,
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 2.0,
                                    sigmaX: 2.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: size.width / 2,
                                    child: Text(i['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ),
                          ],
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

Widget play(size, context, movieController, activeMovieIndex) {
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
              onChanged: (value) {
                movieController.searchMovieByInput(value);
              },
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: size.width / 18,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Sherlock Holmes ...",
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
        Category(movieController: movieController),
        GetX<MovieController>(
            init: MovieController(),
            builder: (controller) {
              if (controller.isLoading.isTrue) {
                return Container(
                  height: size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              } else {
                return Container(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: size.height / 2.6,
                          crossAxisSpacing: 15),
                      itemCount: controller.movies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              new TextEditingController().clear();
                              Get.to(MoviePage(data: controller.movies[index]));
                            },
                            child: Column(
                              children: [
                                MovieCard(
                                  data: controller.movies[index],
                                ),
                              ],
                            ));
                      }),
                );
              }
            }),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget personAccount(
  size,
  context,
  movieController,
  activeMovieIndex,
) {
  return Container(
    child: OrderMovie(),
  );
}
