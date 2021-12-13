import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomePage/components/Category.dart';
class HomePage extends StatefulWidget {

   HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List pages = [home,play,personAccount];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pages[index](size),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {
                    setState(() {
                      index = 0;
                    });
                }, icon: Icon(Icons.home,color: index == 0 ? Colors.white:Colors.blueGrey,)),
                IconButton(onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },icon: Icon(Icons.play_circle_fill_outlined,color: index == 1 ? Colors.white:Colors.blueGrey,)),
               IconButton(onPressed: (){
                 setState(() {
                   index = 2;
                 });

               }, icon: Icon(Icons.person,color: index == 2 ? Colors.white : Colors.blueGrey,))


              ],
            ),
          ),

        ],
      ),
    );
  }


}
Widget home (size) {
  return Container(

  );
}

Widget play (size) {

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width/2,
              child: Text('Find Movies, Tv series, and more...',style: TextStyle(
                fontSize:size.width/22 ,
                color: Colors.white
              ),),
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width:  size.width/1.15,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff211F30)
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined,color: Colors.white,size: size.width/18,),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15),
                    hintText: "Sherlock Holmes",
                    hintStyle: TextStyle(
                      color: Color(0xff6E6D76)
                    ),
                    labelStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Category()
          ],
        ),
      ),
  );
}
Widget personAccount (size) {
  return Container(

  );
}


