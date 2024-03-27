import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownapp/bottombar.dart';
import 'package:ownapp/videofile.dart';
import 'package:ownapp/visualmode.dart';
import 'package:provider/provider.dart';
import 'package:ownapp/visualmode.dart';
import 'package:ownapp/favourite.dart';
void main() {
  runApp(ChangeNotifierProvider<Themeprovider>(
create:(_) => Themeprovider()..initialize() ,

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Consumer<Themeprovider>(builder: (context,provider,child)
    {
      return
        MaterialApp(
          theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      home: splash(),);
    });
  }
}
//hi

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
            child: Image(image: AssetImage("Asset/star.png"))),
        Text("STAR WORLD",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,
            fontStyle: FontStyle.italic,color: Colors.white
        ),
        ),
      ],
    ),
        nextScreen: bottom(),
    backgroundColor: Colors.black,
      splashIconSize: 250,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}

