import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color:const Color(0XFFF8F7F7),
      height: height*0.2,
      width: width*0.1,
      child: Column(children: [
        Image.asset(
          height:height*0.17,
          width: width*0.08,
          fit:BoxFit.cover,
          "assets/image/watch.jpg"),
         const Text("Watch"),
         const Text("\$40"),
      ]),
    );
  }
}