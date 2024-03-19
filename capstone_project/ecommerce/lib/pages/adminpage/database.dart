import 'package:cloud_firestore/cloud_firestore.dart';

// class DataBaseService {
//   Future addNewProduct(Map<String, dynamic> product_detail, String id) async {
//     try {
//       print("yes");
//       await FirebaseFirestore.instance
//           .collection("Products")
//           .doc(id)
//           .set(product_detail);
//       print("data added");
//     } catch (error) {
//       // Failed to add data
//       print('Failed to add data: $error');
//       // Throw the error to propagate it to the calling function
//       throw error;
//     }
//   }
// }
// // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // final CollectionReference _Collection = _firestore.collection('Products');

// // class Response {
// //   int? code;
// //   String? message;
// //   Response({this.code, this.message});
// // }

// // class FirebaseCrud {
// //   static Future<Response> addpro({
// //     required String name,
// //     required double price,
// //     required int amount,
// //     required String imageurl,
// //     required String description,
// //   }) async {
// //     Response response = Response();
// //     DocumentReference documentReferencer = _Collection.doc();

// //     Map<String, dynamic> data = <String, dynamic>{
// //       "Name": name,
// //       "Price": price,
// //       "Amount": amount,
// //       'Description': description,
// //       'Image': imageurl
// //     };

// //     var result = await documentReferencer.set(data).whenComplete(() {
// //       response.code = 200;
// //       response.message = "Sucessfully added to the database";
// //     }).catchError((e) {
// //       response.code = 500;
// //       response.message = e;
// //       print(e);
// //     });

// //     return response;
// //   }
// // }

class DataBaseService {
  Future addNewProduct(Map<String, dynamic> product_detail, String id) async {
    try {
      print("Adding data for ID: $id");
      print("Product details: $product_detail");
      
      await FirebaseFirestore.instance
          .collection("Products")
          .doc(id)
          .set(product_detail);
      
      print("Data added successfully");
    } catch (error) {
      // Failed to add data
      print('Failed to add data: $error');
      // Throw the error to propagate it to the calling function
      throw error;
    }
  }
}
