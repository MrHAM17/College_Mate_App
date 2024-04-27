import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 2),
          color:Colors.greenAccent,
        ),
        height: size.height*0.8,
        width: size.width*0.9,
        ),
      ),

    );


  }
}