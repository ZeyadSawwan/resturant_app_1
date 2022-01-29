import 'package:resturant_app/models/models1.dart';

class CartBloc {
  List<productModel> filterproductlist = [];

  void filteredList(List<productModel> mycontent) {
    for (var product in mycontent) {
      if (product.qty > 0) {
        filterproductlist.add(product);
      }
    }
  }
}
