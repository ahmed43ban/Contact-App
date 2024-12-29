import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contact_data.dart';

class ShowWidget extends StatelessWidget {
  ContactData wanted;
  void Function() ondelet;
   ShowWidget({required this.wanted,required this.ondelet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffFFF1D4),
            borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(alignment: Alignment.bottomLeft,
                children: [Image.file(File(wanted.photo),fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              margin: EdgeInsets.all(8),
              child: Text(wanted.name,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),),
            )
            ]),
          ),
          Container(
            color: Color(0xffFFF1D4),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.mail,color: Color(0xff29384D)),
                ),
                Text(wanted.mail,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 10
                ),),
              ],
            ),
          ),
          Container(color: Color(0xffFFF1D4),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.call,color: Color(0xff29384D),),
                ),
                Text(wanted.number,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 10
                ),),
              ],
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
                onPressed: ondelet,
                child:Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,color: Colors.white,),
                    Text("Delete",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),)
                  ],
                ) ),
          )
        ],
      ),
    );
  }
}
