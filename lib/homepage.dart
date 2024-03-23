import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ownapp/videofile.dart';

class home_p extends StatefulWidget {
  const home_p({super.key});

  @override
  State<home_p> createState() => _home_pState();
}

class _home_pState extends State<home_p> {
  int currentpage = 0;
  List pic = [
    "Asset/Rio.jpeg",
    "Asset/pirate.jpeg",
    "Asset/cobweb.jpeg",
    "Asset/hobbit.jpg",
    "Asset/tintin.jpg",
    "Asset/harry.png",
  ];

  List two = [
    "Asset/fish.jpeg",
    "Asset/meg.jpeg",
    "Asset/heist.jpg",
    "Asset/dragula.jpeg",
    "Asset/avathar.jpeg",
    "Asset/smurfs.jpeg",
    "Asset/batman.jpeg",
  ];

  List three = [
    "Asset/avathar.jpeg",
    "Asset/smurfs.jpeg",
    "Asset/batman.jpeg",
    "Asset/strthings.jpeg",
    "Asset/meg2.jpeg",
    "Asset/avengers.jpeg",
  ];

List four = [
  "Asset/Rio.jpeg",
  "Asset/pirate.jpeg",
  "Asset/cobweb.jpeg",
  "Asset/hobbit.jpg",
  "Asset/tintin.jpg",
  "Asset/harry.png",
] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(alignment: Alignment.topLeft, children: [
                Container(
                  height: 200,
                  width: 300,
                  child: CarouselSlider.builder(
                    carouselController: CarouselController(),
                    itemCount: pic.length,
                    itemBuilder:
                        (BuildContextcontext, int index, int pageViewIndex) {
                      return Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(pic[index]), fit: BoxFit.fill),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: 400,
                        aspectRatio: 8 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentpage = index;
                          });
                        }),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("Asset/star.jpg"),fit: BoxFit.fill)),
                  child: Image(
                    image: AssetImage("Asset/star.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 110,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                          // side: BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "SUBSCRIBE",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>videoplay()));
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.white10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: 30,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "WATCH NOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){

                  }, child: Icon(Icons.add,color: Colors.white,),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white10),
                    ),
                    backgroundColor: Colors.white10,

                  ),),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              DotsIndicator(
                dotsCount: pic.length,
                position: currentpage.toInt(),
                decorator: DotsDecorator(
                  size: Size(5, 5),
                  color: Colors.grey,
                  activeColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Continue Watching for harish",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                width: 300,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.grey,
                ),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(two[index]),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    );
                  },
                  itemCount: two.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Latest release 2024...!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.grey,
                ),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(three[index]),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    );
                  },
                  itemCount: three.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Top Rated on IMDB...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.grey,
                ),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 80,
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(four[index]),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: four.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Popular shows",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                     Colors.grey,
                      Colors.yellowAccent,
                    ],
                  ),
                  // color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 190,
                                height: 90,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image(
                                            image: AssetImage(two[index]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: two.length,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 150,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 190,
                                height: 90,

                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image(
                                            image: AssetImage(three[index]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: three.length,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 150,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 190,
                                height: 90,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image(
                                            image: AssetImage(four[index]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: four.length,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
