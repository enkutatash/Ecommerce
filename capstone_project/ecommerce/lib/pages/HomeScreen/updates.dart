import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scrollbar(
      controller: _controller,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: width * 0.85,
            height: height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF6055D8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  "Get winter Discount",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "20% off",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "For children",
                  style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                  ],
                ),
                const SizedBox(height: 10), // Add space between text and image
                Image.asset(
                  "assets/image/front_girl.png",
                  height: height * 0.2, // Adjust image height as needed
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
