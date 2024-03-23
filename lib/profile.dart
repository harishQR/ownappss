import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  profile({Key? key, }) : super(key: key);
  String name = "Name";
  var phno = "XXX";
  var location = "xxx";
  @override
  State<profile> createState() => _profileState();
}
class _profileState extends State<profile> {
  // final picker = ImagePicker();
   String? img;
  File? imageFile;
@override
void initState(){
  super.initState();
  fiximage();
}
  Future<void> saveImage(String val) async {
    SharedPreferences preferences = await
        SharedPreferences.getInstance();
    preferences.setString('path',val);
  }
   Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker(). pickImage(source: source,imageQuality: 50);
    if (image != null){
      saveImage(image.path.toString());
      setState(() {
        imageFile = File(image.path);
      });
    }
  }
  Future<void> fiximage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      img = preferences.getString("path");
      if (img!=null){
        imageFile = File(img!);
      }
    });
  }
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    List need = [
      "Manage profile",
      "History",
      "Visual Mode",
    ];
    List icons = [
      Icons.edit,
      Icons.history,
      Icons.toggle_on
      // Iconswitch(),
    ];
// void Iconswitch(switch){
//   Column(
//   children: [
//   ],
//   );
// }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  imageFile != null ?
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage:FileImage(imageFile!)
                                    // AssetImage("Asset/prof.png"),
                                  )
                                      :
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.cyanAccent,
                                      backgroundImage:
                                        NetworkImage(
                                            "https://cdn.pixabay.com/photo/2021/07/25/08/03/account-6491185_1280.png"),
                                    ),
                                  Positioned(
                                      left: 75,
                                      top: 0,
                                      child: IconButton(
                                        onPressed: ()  {
                                      showBottomSheet(context: context,
                                          builder: (context){
                                        return SafeArea(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.photo_library),
                                                title: Text('Photo Library'),
                                                onTap: () {
                                                  getImage(ImageSource.gallery);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.photo_camera),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  getImage(ImageSource.camera);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                          } );
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          size: 30,
                                        ),
                                        color: Colors.white,
                                      ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Phno: ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                widget.phno,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Location: ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                widget.location,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Container(
                //   // color: Colors.white10,
                //   width: 300,
                //   height: 80,
                //   decoration: BoxDecoration(
                //     color: Colors.white10,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // )
                Container(
                  height: 280,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: Card(
                          color: Colors.white10,
                          child: ListTile(
                            // onTap: (){},
                            leading: Text(
                              need[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: AlertDialog(
                                              backgroundColor: Colors.black,
                                              shadowColor: Colors.white,
                                              elevation: 5,
                                              // elevation: 5,
                                              // title: Column(
                                              //   children: [
                                              //     Text("Name:"),
                                              //     Text("PhoneNo:"),
                                              //     Text("Location:"),
                                              //   ],
                                              // ),
                                              content: Column(
                                                children: [
                                                  TextFormField(
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    controller: controller1,
                                                    keyboardType:
                                                    TextInputType.text,
                                                    decoration: InputDecoration(
                                                      hintText: "Name",
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    controller: controller2,
                                                    keyboardType:
                                                    TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: "phoneNo",
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    controller: controller3,
                                                    keyboardType:
                                                    TextInputType.text,
                                                    decoration: InputDecoration(
                                                      hintText: "Location",
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            widget.name =
                                                                controller1
                                                                    .text;
                                                            widget.phno =
                                                                controller2
                                                                    .text;
                                                            widget.location =
                                                                controller3
                                                                    .text;
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Text("Edit")),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: Text("cancel"))
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                    break;
                                  case 1:
                                    break;
                                  case 2:
                                    break;
                                  default:
                                    break;
                                }
                              },
                              child: Icon(
                                icons[index],
                                color: Colors.white,
                                size: index == 2 ? 50 : 30,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: need.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}