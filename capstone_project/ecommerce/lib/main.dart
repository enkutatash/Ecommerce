import 'package:ecommerce/pages/General_Screen.dart';
import 'package:ecommerce/pages/Sign_up/page1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyC91XuDnisw5Zcnb57DOgwO_JSnVK3HI6M",
        appId: "1:364138459034:web:330228117a4626b78f1423",
        messagingSenderId: "364138459034",
        projectId: "ecommerce-capstone-bf4ac6",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
  ));
}
