import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ownapp/action.dart';
import 'package:ownapp/Comedy.dart';
import 'package:ownapp/crime.dart';
import 'package:ownapp/drama.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  List txt = [
    "India",
    "Action",
    "Comedy",
    "Crime",
    "Drama",
  ];
  List two = [
    "Asset/fish.jpeg",
    "Asset/meg.jpeg",
    "Asset/heist.jpg",
    "Asset/dragula.jpeg",
    "Asset/avathar.jpeg",
    "Asset/smurfs.jpeg",
    "Asset/batman.jpeg",
    "Asset/hobbit.jpg",
    "Asset/tintin.jpg",
    "Asset/harry.png",
  ];
 List pages =[
search,
action,
Comedy,
crime,
drama,
 ] ;
 int currentint = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: SafeArea(
  child: NestedScrollView(
    headerSliverBuilder: (BuildContext context,bool innerBoxIsscrolled)
  {
    return [SliverAppBar(
      // pinned: true,
      expandedHeight: 80,
      // toolbarHeight: 100,
      stretch: true,
      titleSpacing: 0,
      backgroundColor: Colors.black,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
             Colors.black,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        child: FlexibleSpaceBar(
          centerTitle: false,
        background: Stack(
          children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Container(
                  width: 260,
                  height: 40,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Movies,shows and more",
                      suffixIcon: Icon(Icons.mic
                      ,color: Colors.white,),
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      hintStyle: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ) ,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )
                    ),
                  ),
                         ),
               ),
             ],
           ),
          ]
        ),
        ),
        ),
      ),
    ];
  },
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
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>pages[index]),);
                  switch(index){
                    // case 0: Navigator.push(context, MaterialPageRoute(builder:(context)=>search()));
                    // break;
                    case 1: Navigator.push(context, MaterialPageRoute(builder:(context)=>action()));
                    break;
                    case 2: Navigator.push(context, MaterialPageRoute(builder:(context)=>crime()));
                    break;
                    case 3: Navigator.push(context, MaterialPageRoute(builder:(context)=>Comedy()));
                    break;
                    case 4: Navigator.push(context, MaterialPageRoute(builder:(context)=>drama()));
                    break;
                    }
            }
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: AnimatedContainer(
              duration: Duration(microseconds: 300),
              width: 70,
              height: 10,
              decoration: BoxDecoration(
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
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10)
            // ),
            child: MasonryGridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: two.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                    // decoration: BoxDecoration(
                    //   // borderRadius: BorderRadius.circular(10),
                    // ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(image: AssetImage(two[index])))),
              ),
            ),
          ),
    SizedBox(height: 5,),
      ],
    ),
  ),

  ),
),
    );
  }
}
