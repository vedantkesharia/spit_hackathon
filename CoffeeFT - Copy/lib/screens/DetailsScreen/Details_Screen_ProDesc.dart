import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/Models/Products.dart';

class Product_Heading extends StatefulWidget {
  const Product_Heading({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<Product_Heading> createState() => _Product_HeadingState();
}

class _Product_HeadingState extends State<Product_Heading> {
  // late IconData _iconData =
  //     widget.product.isfav ? Icons.favorite : Icons.favorite_border;
  // void toggleIcon() {
  //   setState(() {
  //     if (_iconData == Icons.favorite) {
  //       _iconData = Icons.favorite_border;
  //     } else {
  //       _iconData = Icons.favorite;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "${widget.name} ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        // LikeButton(
        //   ontap: toggleIcon,
        //   iconData: _iconData,
        // ),
      ],
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.ontap,
    required this.iconData,
  });

  final VoidCallback ontap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ontap,
      child: Icon(
        iconData,
        color: Colors.red,
        size: 25,
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.product.description,
      style: TextStyle(
        color: Colors.grey.shade100,
        fontSize: 16,
      ),
      textAlign: TextAlign.justify,
      maxLines: 8,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.product,
  });

  final product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '₹ ${widget.product.price}',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        AddToCartButton(product: widget.product),
      ],
    );
  }
}

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final product;


  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
    final _cartItems =
    FirebaseFirestore.instance.collection('cart').doc(_currentUser);

    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: _cartItems.get(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.data();
          final value = data![widget.product.id];
          if(value != null) {
            return IconButton(
                onPressed: () {
                  _cartItems.update({widget.product.id: FieldValue.delete()});
                  print('removed from cart');
                  setState(() {});
                },
                icon: Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                  size: 40,
                ));
          }
          return IconButton(
              onPressed: () {
                _cartItems.set({widget.product.id: 1}, SetOptions(merge: true));
                print('added cart');
                setState(() {});
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 40,
              ));
        }
        return IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 40,
            ));
      },
    );
  }
}
