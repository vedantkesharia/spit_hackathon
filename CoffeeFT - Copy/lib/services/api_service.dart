import 'dart:ffi';

import 'package:coffeeft/Models/Cart_Data.dart';
import 'package:coffeeft/models/Products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ApiService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Product>> getAllProducts() async {
    try {
      final ref = await _firebaseFirestore.collection('products').get();
      return (ref.docs.map((e) => Product.fromFirestore(e)).toList());
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
  Future<List> getCartProducts() async {
    try {
      final _currentUser = FirebaseAuth.instance.currentUser?.uid;
      final _cartItems = await _firebaseFirestore.collection('cart').doc(_currentUser).get();

      List<Cart>? list = _cartItems.data()?.entries.map((entry) {
        return Cart(
          product: entry.key,
          quantity: entry.value,
        );
      }).toList() ?? [];

      List product_list = [];
      for (var item in list){
        DocumentReference docRef = _firebaseFirestore.collection('products').doc(item.product);
        DocumentSnapshot docSnap = await docRef.get();
        Product product = Product.fromFirestore(docSnap as DocumentSnapshot<Map<String, dynamic>>);
        product_list.add(int.parse(product.price) * item.quantity);
      }
      return product_list;

    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
  Future<String> getCibil() async {
    final _firestore = FirebaseFirestore.instance;
    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot doc = await _firestore.collection('users').doc(_currentUser).get();
    // get the cibil score from the document data
    final data = doc.data()! as Map<String, dynamic>;
    final cibilScore = data['cibilScore'];
    return cibilScore;
  }
}
