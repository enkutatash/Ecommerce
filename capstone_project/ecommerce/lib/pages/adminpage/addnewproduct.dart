// import 'dart:ffi';

import 'package:ecommerce/pages/General_Screen.dart';
import 'package:ecommerce/pages/Sign_up/page2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/pages/FireBase/firebase_auth.dart';

class AddNewProduct extends StatefulWidget {
  AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  // final Firebase_auth_service _auth = Firebase_auth_service();
  late final Firebase_auth_service _auth;

  final Name = TextEditingController();
  final Price = TextEditingController();
  final Description = TextEditingController();

  bool ischecked = false;

  @override
  void initState() {
    _auth = Firebase_auth_service(context);
    super.initState();
  }

  @override
  void dispose() {
    Name.dispose();
    Price.dispose();
    Description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05, left: width * 0.1, right: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add New Product",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(
              height: height * 0.03,
            ),
             Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  child: ElevatedButton(
                    onPressed:(){},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side:const BorderSide(color: Color(0XFF6055D8)), // Adjust border color here
      ),
    ),
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_upload_outlined,color: Color(0XFF6055D8),)
                        ,Text(
                          "Upload product picture",
                          style: TextStyle(color:Color(0XFF6055D8)),
                        ),
                      ],
                    ), // Add your button text here
                  ),
                ),
                SizedBox(
              height: height * 0.03,
            ),
            const Text(
              "Product Name",
              style: TextStyle(color: Colors.black),
            ),
            textfield(
              "Nike shoes",
              Name,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              "Product Price",
              style: TextStyle(color: Colors.black),
            ),
            textfield(
              "\$200",
             Price,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Product Description",
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            textfield("Description",Description),
            SizedBox(
              height: height * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.8,
                  child: ElevatedButton(
                    onPressed: _addProduct,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF6055D8)),
                    child: Text(
                      "Add Product ",
                      style: TextStyle(color: Colors.white),
                    ), // Add your button text here
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some action to take when the user presses the action button
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addProduct() async {
    String name = Name.text;
    double price = Price.text as double;
    String description = Description.text;

   
  }
}

Widget textfield(
  String hint,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFF6055D8)),
      ),
    ),
  );
}
