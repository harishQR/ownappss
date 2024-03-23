import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ownapp/Comedy.dart';
import 'package:ownapp/favourite.dart';
import 'package:ownapp/homepage.dart';
import 'package:ownapp/profile.dart';
import 'package:ownapp/search_page.dart';
class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
int index = 0;
List pages = [
  home_p(),
  search(),
  favourite(),
  profile(),
];
void tap(indexs){
  setState(() {
    index = indexs;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body:pages[index] ,
      bottomNavigationBar: CurvedNavigationBar(

        height: 45,
        animationDuration: Duration(microseconds: 100),
color: Colors.black,
          backgroundColor:Colors.yellowAccent,
          buttonBackgroundColor: Colors.black,
          items: [
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.search,color: Colors.white,),
            Icon(Icons.favorite,color: Colors.white,),
            Icon(Icons.person,color: Colors.white,),
      ],
      onTap:tap,
        // currentIndex: index,
      // selectedLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
