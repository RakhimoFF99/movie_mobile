import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  final data;

  MoviePage({this.data});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var networkPlayerWidget;
  bool showPlayer = false;
  @override
  @override
  void initState() {
    super.initState();
    print(widget.data);
    networkPlayerWidget = BetterPlayer.network(
      widget.data['videoPath'],
      betterPlayerConfiguration: BetterPlayerConfiguration(
          autoPlay: true,
          placeholder: Center(child: CircularProgressIndicator()),
          allowedScreenSleep: false,
          autoDispose: true,
          autoDetectFullscreenDeviceOrientation: false,
          autoDetectFullscreenAspectRatio: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/bg.jpg"))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                networkPlayerWidget,
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
                                color: Colors.white70,
                                fontSize: size.width / 30),
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
      ),
    );
  }
}
