import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late String name, description;
  late String imageurl;
  late String nft, price;
  late bool isfav;
  late String id;

  Product({
    required this.name,
    required this.description,
    required this.price,
    this.nft = '5000',
    required this.imageurl,
    this.isfav = false,
    this.id = '0'
  });

  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final data = snapshot.data();
    return Product(
        name: data!['name'],
        description: data['description'],
        price: data['price'],
        nft: data['nft'],
        imageurl: data['imageurl']);
  }
}

List<Product> Items = [
  Product(
    name: "Americano with Coffee spread",
    description:
        "It's more than a standard Black Coffee with a taste of blended coffee from within",
    price: "100",
    imageurl: "assets/Types/Americano/1.png",
    isfav: true,
    id: "1",
  ),
  Product(
    name: "Decaf with extra Caffeine",
    description: "It's more than a standard Black Coffee!",
    price: "150",
    imageurl: "assets/Types/Decaf/4.png",
    id: "2",
  ),
  Product(
    name: "Irish with extra cream and cocoa",
    description: "It's more than a standard Black Coffee!",
    price: '170',
    imageurl: "assets/Types/Irish/1.png",
    id: '3',
  ),
  Product(
    name: "Macchiato with Chocolate flavourings",
    description: "It's more than a standard Black Coffee!",
    price: '200',
    imageurl: "assets/Types/Macchiato/1.png",
    isfav: true,
    id: '4',
  ),
  Product(
    name: "Mocha with shivered with more toppings",
    description: "It's more than a standard Black Coffee!",
    price: '150',
    imageurl: "assets/Types/Mocha/1.png",
    id: '5',
  ),
];
