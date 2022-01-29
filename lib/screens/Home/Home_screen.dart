import 'package:flutter/material.dart';
import 'package:resturant_app/models/models1.dart';
import 'package:resturant_app/screens/Cart/Cart_Screen.dart';
import 'package:resturant_app/screens/Home/Home_bloc.dart';

import 'package:resturant_app/screens/Product_Details/product_Details_Screen.dart';
import 'package:resturant_app/screens/Profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = HomeScreenBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(),
        body: selectedTab(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFFA7BBDB),
          showSelectedLabels: true,
          iconSize: 30,
          currentIndex: bloc.selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (index) {
            bloc.selectedIndex = index;
            setState(() {});
          },
        ));
  }

  Widget selectedTab() {
    if (bloc.selectedIndex == 0) {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
            padding: EdgeInsets.all(4),
            itemCount: bloc.Listcontent.length,
            itemBuilder: (context, index) {
              return smoothiesWidget(bloc.Listcontent[index], index);
            }),
      );
    } else if (bloc.selectedIndex == 1) {
      return CartScreen(
        mycontent: bloc.Listcontent,
      );
    } else {
      return profileScreen();
    }
  }

  Widget smoothiesWidget(productModel content, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      indx: index,
                      allproduct: bloc.Listcontent,
                    )));
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: content.bgcolors,
                    ),
                    //gradient: content.gradient,
                    borderRadius: BorderRadius.circular(37.5),
                  ),
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(content.productName,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Expanded(child: Container()),
                        Text("${content.productPrice}" + " " + content.currency,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  content.images4product,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        bloc.returnCorrectName(bloc.selectedIndex),
        style: TextStyle(color: Colors.grey),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.grey)),
      ],
    );
  }
}
