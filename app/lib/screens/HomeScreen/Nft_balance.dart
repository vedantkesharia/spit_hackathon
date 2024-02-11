import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/models/ethereum_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/services/api_service.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final ethUtils = EthereumUtils();

  var _data;

  @override
  void initState()
  {
    ethUtils.initial();
    ethUtils.getBalance().then((value){
      _data = value;
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final Api = ApiService();
    final cibil = Api.getCibil();
    return Container(
      width: double.infinity,
      height: getproportionatescreenheight(180),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: deepgreen,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              'Kisan Loan',
              style: TextStyle(fontSize: 25),
            ),
            Spacer(),
            Container(
              //color: Colors.white,
              child: Image.asset(
                "assets/images/logo.png",
                width: 70,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          'Your CIBIL Score',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Text(
          '400.5',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ]),
    );
  }
}
