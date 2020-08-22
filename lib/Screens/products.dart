import 'package:firestore_with_provider/Provider/Product_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_products.dart';
import 'package:firestore_with_provider/Models/Product_Model.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product_Model>>(context);
    print(products);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Edit_Products()));
              })
        ],
      ),
      body: (products != null)
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].Name),
                  trailing: Text(products[index].Price.toString()),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Edit_Products(
                              products[index],
                            )));
                  },
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
