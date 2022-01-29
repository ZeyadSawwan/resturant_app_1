import 'package:flutter/material.dart';
import 'package:resturant_app/models/models1.dart';
import 'package:resturant_app/screens/Cart/Cart_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({required this.mycontent});
  List<productModel> mycontent;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var bloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    bloc.filteredList(widget.mycontent);
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),
      body: ListView.builder(
          itemCount: bloc.filterproductlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0x8CE6E6E6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                height: 140,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8),
                          child: Image.asset(
                            bloc.filterproductlist[index].images4product,
                            scale: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 14),
                          child: Column(
                            children: [
                              Text(bloc.filterproductlist[index].productName),
                              Text("200ml, 1x")
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                IconButton(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 0, right: 0),
                                    onPressed: () {
                                      if (bloc.filterproductlist[index].qty ==
                                          0) {
                                        return;
                                      }
                                      bloc.filterproductlist[index].qty =
                                          bloc.filterproductlist[index].qty - 1;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.remove_circle,
                                        color: Colors.grey)),
                                Text(
                                    bloc.filterproductlist[index].qty
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22)),
                                IconButton(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 0, right: 0),
                                  onPressed: () {
                                    bloc.filterproductlist[index].qty =
                                        bloc.filterproductlist[index].qty + 1;
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.add_circle,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Text(
                              (bloc.filterproductlist[index].productPrice *
                                          bloc.filterproductlist[index].qty)
                                      .toString() +
                                  " " +
                                  bloc.filterproductlist[index].currency,
                              style: TextStyle(
                                  color: Color(0xFF353535), fontSize: 20)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
