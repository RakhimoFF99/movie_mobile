import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/getx/category/category_controller.dart';

class Category extends StatefulWidget {
  final movieController;
  const Category({this.movieController});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int indexTitle = 0;

  var categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: GetX<CategoryController>(
            init: CategoryController(),
            builder: (controller) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
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
                                  if (index == 0) {
                                    widget.movieController
                                        .getAllMoviesByCategory();
                                  } else {
                                    widget.movieController.getMovieByCategory(
                                        controller.categories[index]['_id']);
                                  }
                                });
                              },
                              child: Text(
                                controller.categories[index]['category'],
                                style: TextStyle(
                                  color: indexTitle == index
                                      ? Colors.red
                                      : Colors.white,
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
                  });
            }));
  }
}
