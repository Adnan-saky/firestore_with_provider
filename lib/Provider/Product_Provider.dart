import 'package:firestore_with_provider/Models/Product_Model.dart';
import 'package:firestore_with_provider/Services/FireStore_Service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product_Provider extends ChangeNotifier {
  String _name;
  double _price;
  String _productID;
  var uuid = Uuid();

  final FirestoreService = FireStore_Service(); 


  ///Getter
  String get name => _name;

  double get price => _price;


  ///setter
  ChangePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  ChangeName(String value) {
    _name = value;
    notifyListeners();
  }

  loadValues(Product_Model product){
    _name = product.Name;
    _price = product.Price;
    _productID = product.ProductId;
  }


  SaveProduct()
  {
    if(_productID == null) {
      var NewProduct = Product_Model(
          Name: name, Price: price, ProductId: uuid.v4());
      FirestoreService.SaveProduct(NewProduct);
    }else{
  //Update
  var updatedProduct =
  Product_Model(Name: name, Price: _price, ProductId: _productID);
  FirestoreService.SaveProduct(updatedProduct);
    }
  }

  removeProduct(String productId)
  {
    FirestoreService.removeProduct(productId);
    print("fffffffffff");

  }


}
