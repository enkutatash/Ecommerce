// import 'dart:ffi';

import 'dart:convert'; // Import for base64 encoding
import 'dart:io';
import 'package:random_string/random_string.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/pages/General_Screen.dart';
import 'package:ecommerce/pages/Sign_up/page2.dart';
import 'package:ecommerce/pages/adminpage/database.dart';
import 'package:ecommerce/pages/adminpage/editnewproduct.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/pages/FireBase/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AddNewProduct extends StatefulWidget {
  AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  // final Firebase_auth_service _auth = Firebase_auth_service();
  late final Firebase_auth_service _auth;
  String? _selectedSize;
  File? _image;
  List<String> size = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  final Name = TextEditingController();
  final Price = TextEditingController();
  final Description = TextEditingController();
  final Amount = TextEditingController();
  String _imageUrl = "FrontPage_asset/image/front_girl.png";

  bool ischecked = false;

  Future<void> _imagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    if (kIsWeb) {
      // Convert image data to base64 for web
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);
      setState(() {
        _imageUrl = 'data:image/jpeg;base64,$base64Image';
      });
    } else {
      // For mobile platforms, set the image directly
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    }
  }

  @override
  void initState() {
    _auth = Firebase_auth_service(context);

    super.initState();
  }

  @override
  void dispose() {
    Amount.dispose();
    Name.dispose();
    Price.dispose();
    Description.dispose();
    super.dispose();
  }

  Future<void> addproduct(
      TextEditingController Name,
      TextEditingController Price,
      TextEditingController Amount,
      TextEditingController Description,
      String _imageUrl) async {
    CollectionReference product =
        FirebaseFirestore.instance.collection('Products');

    return product
        .add({
          'Name': Name.text,
          'Price': double.parse(Price.text),
          'Amount': int.parse(Amount.text),
          'Description': Description.text,
          'Image': _imageUrl,
        })
        .then((value) => print("product added successfully!"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width * 0.5,
                      child: ElevatedButton(
                        onPressed: _imagePicker,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              side: const BorderSide(
                                  color: Color(
                                      0XFF6055D8)), // Adjust border color here
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              color: Color(0XFF6055D8),
                            ),
                            Text(
                              "Upload product picture",
                              style: TextStyle(color: Color(0XFF6055D8)),
                            ),
                          ],
                        ), // Add your button text here
                      ),
                    ),
                    _imageUrl != null
                        ? Image.network(
                            _imageUrl,
                            width: width * 0.4,
                            height: height * 0.1,
                          )
                        : Image.asset("FrontPage_asset/image/front_girl.png"),
                  ],
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
                TextInputType.text,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Price",
                style: TextStyle(color: Colors.black),
              ),
              textfield("\$200", Price, TextInputType.number),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Amount",
                style: TextStyle(color: Colors.black),
              ),
              textfield("1", Amount, TextInputType.number),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Description",
                style: TextStyle(color: Colors.black),
              ),
              textfield("Description", Description, TextInputType.text),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Size",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              DropdownButton<String>(
                value: _selectedSize,
                hint: const Text("Select Size"),
                items: size.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSize = newValue!;
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.8,
                    child: ElevatedButton(
                      onPressed: () async {
                        await addproduct(Name, Price, Amount, Description, _imageUrl);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF6055D8)),
                      child: const Text(
                        "Add Product ",
                        style: TextStyle(color: Colors.white),
                      ), // Add your button text here
                    ),
                  ),
                ],
              ),
            ],
          ),
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
}

Widget textfield(
  String hint,
  TextEditingController controller,
  TextInputType keyboardType,
) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
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
