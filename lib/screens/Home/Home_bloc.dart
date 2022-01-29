import 'package:flutter/material.dart';
import 'package:resturant_app/models/models1.dart';

class HomeScreenBloc {
  var selectedIndex = 0;

  List<productModel> Listcontent = [
    productModel(
      bgcolors: [
        Color(0xFFF45D7E),
        Color(0xFFEC90E9),
      ],
      productName: "Watermelon",
      productPrice: 6.00,
      currency: "JD",
      images4product: ("Assets/images/juice1.png"),
    ),
    productModel(
        productName: "Mango",
        productPrice: 3.00,
        currency: "JD",
        images4product: ("Assets/images/juice2.png"),
        bgcolors: [
          Color(0xFFFD9B8D),
          Color(0xFFFBBE7E),
        ]),
    productModel(
        productName: "Blueberry",
        productPrice: 5.00,
        currency: "JD",
        images4product: ("Assets/images/juice3.png"),
        bgcolors: [
          Color(0xFFA076E8),
          Color(0xFFB1C4F8),
        ]),
    productModel(
        productName: "Avocado",
        productPrice: 7.00,
        currency: "JD",
        images4product: ("Assets/images/juice4.png"),
        bgcolors: [
          Color(0xFF5CCD92),
          Color(0xFFBFE89C),
        ]),
    productModel(
        productName: "Grape",
        productPrice: 3.50,
        currency: "JD",
        images4product: ("Assets/images/juice5.png"),
        bgcolors: [
          Color(0xFFA86FDA),
          Color(0xFFF5B9D5),
        ]),
    productModel(
        productName: "Apple",
        productPrice: 2.75,
        currency: "JD",
        images4product: ("Assets/images/juice6.png"),
        bgcolors: [
          Color(0xFFF4787C),
          Color(0xFFFBA6C6),
        ]),
  ];

  String returnCorrectName(int tabSelecetedIndex) {
    switch (tabSelecetedIndex) {
      case 0:
        return "Home";
      case 1:
        return "Cart";
      default:
        return "Profile";
    }
  }
}
