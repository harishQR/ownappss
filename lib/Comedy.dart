import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Comedy extends StatefulWidget {
  const Comedy({super.key});

  @override
  State<Comedy> createState() => _ComedyState();
}

class _ComedyState extends State<Comedy> {
  int Currentindex = 0 ;
  int currentint = 0;
  List txt = [
    "India",
    "Action",
    "Comedy",
    "Crime",
    "Drama",
  ];
  // List three = [
  //   "Asset/avathar.jpeg",
  //   "Asset/smurfs.jpeg",
  //   "Asset/batman.jpeg",
  //   "Asset/strthings.jpeg",
  //   "Asset/meg2.jpeg",
  //   "Asset/avengers.jpeg",
  // ];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.grey,

              ),
              child:ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        currentint = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        width: 70,
                        height: 10,
                        decoration: BoxDecoration(
                          // color: currentint == index?Colors.white30:Colors.white10,
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                            border: currentint ==index? Border.all(color: Colors.purple,width:2 ):null
                        ),
                        child: Center(child: Text(txt[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)),
                      ),
                    ),
                  );
                },
                itemCount: txt.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              height: 550,
              width: double.infinity,
              child: MasonryGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: four.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image(image: AssetImage(four[index])),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
