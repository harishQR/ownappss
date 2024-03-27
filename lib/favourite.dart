import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteModel extends ChangeNotifier {
  List<String> pic = [
    "Asset/Rio.jpeg",
    "Asset/pirate.jpeg",
    "Asset/cobweb.jpeg",
    "Asset/hobbit.jpg",
    "Asset/tintin.jpg",
    "Asset/harry.png",
  ];

  List<String> txt = [
    "RIO",
    "Pirates",
    "Cobweb",
    "hobbit",
    "Tintin",
    "Harry Potter",
  ];

  List<String> subtxt = [
    "2h 13m - 616MB",
    "1h 45m - 679Mb",
    "3h 46m - 456MB",
    "2h 25m - 567MB",
    "1h 56m - 654MB",
    "2h 20m - 450MB",
  ];
}

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  List pic = [
    "Asset/Rio.jpeg",
    "Asset/pirate.jpeg",
    "Asset/cobweb.jpeg",
    "Asset/hobbit.jpg",
    "Asset/tintin.jpg",
    "Asset/harry.png",
  ];
  List txt = [
    "RIO",
    "Pirates",
    "Cobweb",
    "hobbit",
    "Tintin",
    "Harry Potter",
  ];
List subtxt=[
  "2h 13m - 616MB",
  "1h 45m - 679Mb",
  "3h 46m - 456MB",
  "2h 25m - 567MB",
  "1h 56m - 654MB",
  "2h 20m - 450MB",
] ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteModel() ,
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<FavouriteModel>(
            builder: (context,themedata,_) => ListView.builder(
              itemBuilder:(BuildContext context,int index){
                return ListTile(
                  onTap: (){
                  },
                  leading:Container(
                    width: 100,
                    height:60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(pic[index],),fit: BoxFit.fill
                    ),
                  ),),
                  title:Text(txt[index],style: TextStyle(color: Theme.of(context).textTheme.bodyText1 !.color,fontSize: 15,fontWeight: FontWeight.bold),),
                  subtitle:Text(subtxt[index],style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color,),),
                  trailing:Icon(Icons.more_vert_rounded,color: Theme.of(context).textTheme.bodyText1!.color,) ,
                          );
              } ,
            itemCount: pic.length,
            ),
          ),
        ),
      ),
    );
  }
}
