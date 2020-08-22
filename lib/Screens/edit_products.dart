import 'package:firestore_with_provider/Models/Product_Model.dart';
import 'package:firestore_with_provider/Provider/Product_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit_Products extends StatefulWidget {
  final Product_Model editproduct;

  Edit_Products([this.editproduct]);

  @override
  _Edit_ProductsState createState() => _Edit_ProductsState();
}

class _Edit_ProductsState extends State<Edit_Products> {
  final nameController = new TextEditingController();
  final priceController = new TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editproduct == null) {
      nameController.text = "";
      priceController.text = "";
      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of(context, listen: false);
        productProvider.loadValues(Product_Model());
      });
    } else {
      /// existing
      nameController.text = widget.editproduct.Name;
      priceController.text = widget.editproduct.Price.toString();

      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<Product_Provider>(context, listen: false);
        productProvider.loadValues(widget.editproduct);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Product_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Product",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.add_shopping_cart),
                hintText: "Product Name",
              ),
              onChanged: (value) {
                productProvider.ChangeName(value);
              },
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money),
                hintText: "Product Price",
              ),
              onChanged: (value) {
                productProvider.ChangePrice(value);
              },
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              onPressed: () {
                productProvider.SaveProduct();
                Navigator.of(context).pop();
              },
              child: Text("Save"),
              color: Colors.green,
            ),
            (widget.editproduct != null)
                ? RaisedButton(
                    onPressed: () {

                      productProvider
                          .removeProduct(widget.editproduct.ProductId);
                      Navigator.of(context).pop();
                    },
                    child: Text("Delete"),
                    color: Colors.red,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
