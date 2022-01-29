import 'package:flutter/material.dart';

class productModel {
  String productName;
  double productPrice;
  List<Color> bgcolors;
  String images4product;
  String currency;
  int qty;
//  Gradient gradient;

  productModel({
    // required this.gradient,
    required this.productName,
    required this.productPrice,
    required this.bgcolors,
    required this.images4product,
    required this.currency,
    this.qty = 0,
  });
}
