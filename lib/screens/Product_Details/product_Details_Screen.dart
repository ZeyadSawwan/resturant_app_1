import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resturant_app/models/models1.dart';
import 'package:getwidget/getwidget.dart';
import 'package:resturant_app/screens/Cart/Cart_Screen.dart';
import 'package:resturant_app/Utils/custom_button.dart';
import 'package:resturant_app/screens/Product_Details/product_details_bloc.dart';

class ProductScreen extends StatefulWidget {
  int indx;
  List<productModel> allproduct;
  var bloc = ProductBloc();
  ProductScreen({required this.indx, required this.allproduct});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  double _customrating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Column(
        children: [
          _buildCarousel(context, 0),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GFRating(
              color: GFColors.DANGER,
              value: _customrating,
              halfFilledIcon: Icon(Icons.star_half, color: Color(0xFFdf4759)),
              allowHalfRating: true,
              itemCount: 5,
              onChanged: (value) {
                setState(() {
                  _customrating = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, top: 40),
            child: MyElevatedButton(
              height: 40,
              gradient: LinearGradient(
                  colors: [Color(0xFFF46186), Color(0xFFEE87D7)]),
              child: Text(
                "Add to cart",
              ),
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartScreen(allproduct: widget.allproduct)));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      height: 400.0,
      child: PageView.builder(
        itemCount: widget.allproduct.length,
        onPageChanged: (inx) {
          widget.indx = inx;
          setState(() {});
        },
        controller:
            PageController(initialPage: widget.indx, viewportFraction: 0.8),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _boxCard(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _boxCard(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: widget.allproduct[itemIndex].bgcolors,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 63,
            ),
            Image.asset(
              widget.allproduct[itemIndex].images4product,
              scale: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                widget.allproduct[itemIndex].productName,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/images/successIcon.png"),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "200 ml, 1x",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.allproduct[itemIndex].productPrice.toString() +
                        " " +
                        widget.allproduct[itemIndex].currency,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            onPressed: () {
                              if (widget.allproduct[widget.indx].qty == 0) {
                                return;
                              }
                              widget.allproduct[itemIndex].qty =
                                  widget.allproduct[itemIndex].qty - 1;
                              setState(() {});
                            },
                            icon:
                                Icon(Icons.remove_circle, color: Colors.white)),
                        Text(widget.allproduct[itemIndex].qty.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                        IconButton(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 0, right: 0),
                          onPressed: () {
                            widget.allproduct[itemIndex].qty =
                                widget.allproduct[itemIndex].qty + 1;
                            setState(() {});
                          },
                          icon: Icon(Icons.add_circle, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                      (widget.allproduct[itemIndex].productPrice *
                                  widget.allproduct[itemIndex].qty)
                              .toString() +
                          " " +
                          widget.allproduct[itemIndex].currency,
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        (widget.allproduct[widget.indx].productName),
        style: TextStyle(color: Colors.grey),
      ),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.grey,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.grey)),
      ],
    );
  }
}
