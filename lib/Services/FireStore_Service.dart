import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_with_provider/Models/Product_Model.dart';


class FireStore_Service{
  Firestore _db = Firestore.instance;

  Future <void> SaveProduct(Product_Model products)
  {
    return _db.collection("Products").document(products.ProductId).setData(products.toMap());
  }

  Stream <List<Product_Model>> GetProduct()
  {
   return _db.collection("Products").snapshots().map((snapshot) => snapshot.documents.map((document) => Product_Model.fromFirestore(document.data)).toList());
  }

  Future<void>removeProduct(String productId)
  {
    print("fffffffffffffa");
    return _db.collection("Products").document(productId).delete();

  }


}
