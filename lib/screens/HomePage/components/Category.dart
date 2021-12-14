import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int indexTitle = 0;
  List categories = [
    "Movies",
    "Tv Series",
    "Documentary",
    "Sports",
    "Horror",
    "Thriller"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          indexTitle = index;
                        });
                      },
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color:
                              indexTitle == index ? Colors.red : Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    indexTitle == index
                        ? Container(
                            width: 20,
                            height: 3,
                            color: Colors.red,
                          )
                        : Container()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
