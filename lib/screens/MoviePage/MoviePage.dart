import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/getx/home_controller/home_controller.dart';

class MoviePage extends StatefulWidget {
  final index;
  final data;

  MoviePage({Key? key, this.index, this.data}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var homeController = Get.put(HomeController(), permanent: false);
  bool showPlayer = false;
  @override
  void dispose() {
    super.dispose();
    homeController.disposeVideo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showPlayer
                  ? GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) {
                        return Container(
                          height: size.height / 3,
                          width: double.infinity,
                          child: Center(
                              child: controller.chewieController != null &&
                                      controller
                                          .chewieController!
                                          .videoPlayerController
                                          .value
                                          .isInitialized
                                  ? Chewie(
                                      controller: controller.chewieController!)
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Loading")
                                      ],
                                    )),
                        );
                      })
                  : Stack(
                      children: [
                        Hero(
                          tag: widget.index,
                          child: Container(
                            height: size.height / 3,
                            width: double.infinity,
                            child: Container(
                              child: Image.network(widget.data['mainImagePath'],
                                  fit: BoxFit.fill),
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
                                onPressed: () {
                                  setState(() {
                                    homeController.initializePlayer(
                                        widget.data['videoPath']);
                                    showPlayer = true;
                                  });
                                },
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
                      widget.data['name'],
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
                          widget.data['duration'].toString(),
                          style: TextStyle(
                            fontSize: size.width / 28,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "min",
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
                              "Дата выпуска",
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
                                  color: Colors.white70,
                                  fontSize: size.width / 30),
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
                              "Категория",
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
                      "Описание",
                      style: TextStyle(
                          fontSize: size.width / 25,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data['description'],
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
        ),
      ),
    );
  }
}
