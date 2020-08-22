
class Product_Model {
  final String ProductId;
  final String Name;
  final double Price;

  Product_Model({this.ProductId, this.Name, this.Price});

  Map <String, dynamic> toMap(){

    return{
    'ProductId' : ProductId,
    'Name' : Name,
    'price' : Price,
    };
  }
  Product_Model.fromFirestore(Map <String, dynamic> firestore)
    : ProductId = firestore['ProductId'],
      Name = firestore['Name'],
      Price = firestore['price'];
}
