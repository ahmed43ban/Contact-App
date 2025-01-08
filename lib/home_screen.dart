import 'dart:io';

import 'package:contact_app/contact_data.dart';
import 'package:contact_app/show_widget.dart';
import 'package:contact_app/textfield_read_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = "home";

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<ContactData> enterd = [];
  String path = "";
  final ImagePicker userphoto = ImagePicker();
  Future<void> requestPermissions() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus storageStatus = await Permission.photos.request();

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Permissions Required"),
          content: Text(
              "This app requires camera and storage permissions to work properly."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> userImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Image Source"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: Text("Camera"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: Text("Gallery"),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? pickedFile = await userphoto.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          path = pickedFile.path;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff29384D),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 10,
        ),
        body: enterd.isEmpty
            ? Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/route2.png"),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/images/animations/empty_list.json",
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Text("There is No Contacts Added Here",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: AddContactSheet,
                    child: Icon(
                      Icons.add,
                      color: Color(0xff29384D),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        )
            : Column(
          children: [
            Row(
              children: [Image.asset("assets/images/route2.png")],
            ),
            Expanded(
                child: Stack(alignment: Alignment.bottomRight, children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 2,
                        crossAxisCount: 2),
                    itemBuilder: Showing,
                    itemCount: enterd.length,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () => deltelast(enterd),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (enterd.length <= 5)
                          FloatingActionButton(
                            onPressed: AddContactSheet,
                            child: Icon(
                              Icons.add,
                              color: Color(0xff29384D),
                            ),
                            backgroundColor: Colors.white,
                          ),
                      ],
                    ),
                  )
                ])),
          ],
        ));
  }

  ShowWidget Showing(BuildContext context, int position) {
    return ShowWidget(
      wanted: enterd[position],
      ondelet: () => deletcontact(position),
    );
  }

  void deltelast(List<ContactData> enterd) {
    setState(() {
      enterd.removeLast();
    });
  }

  void deletcontact(int index) {
    setState(() {
      enterd.removeAt(index);
    });
  }

  void AddContactSheet() {
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          color: Color(0xff29384D),
          child: ListView(children: [
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              userImage();
                            },
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    shape: BoxShape.rectangle,
                                    border:
                                    Border.all(color: Color(0xffFFF1D4))),
                                child: path == ""
                                    ? Lottie.asset(
                                    "assets/images/animations/Animation - 1734998635011.json",
                                    width: 124,
                                    height: 124,
                                    fit: BoxFit.contain)
                                    : Image.file(
                                  File(path),
                                  fit: BoxFit.fill,
                                  width: 124,
                                  height: 124,
                                )),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextfieldRead(fieldcontrol: nameController, Textfi: "User Name",line: Color(0xffFFF1D4),),
                            TextfieldRead(fieldcontrol: emailController, Textfi: "example@email.com",line: Color(0xffFFF1D4),),
                            TextfieldRead(fieldcontrol: numberController, Textfi: "+200000000000",line: Colors.transparent,),],
                        ),
                      )
                    ],
                  ),
                ),
                TextfieldInput(fieldcontrol: nameController, Textfi: "Enter User Name "),
                TextfieldInput(fieldcontrol: emailController, Textfi: "Enter User Email"),
                TextfieldInput(fieldcontrol: numberController, Textfi: "Enter User Phone"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final name = nameController.text;
                          final number = numberController.text;
                          final email = emailController.text;

                          // Add the new contact to the list
                          if (name.isNotEmpty &&
                              number.isNotEmpty &&
                              email.isNotEmpty) {
                            setState(() {
                              enterd.add(ContactData(
                                name: name,
                                number: number,
                                mail: email,
                                photo: path, // Use the captured photo's path here
                              ));
                              path = "";
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Enter User"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
