import 'package:flutter/material.dart';
import 'package:ecommerce/pages/HomeScreen/Item.dart';
class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              Text("see all",style: TextStyle(fontSize: 16,color: Color(0XFF6055D8)),)
            ],
          )
          ],
      ),
    );
  }
}