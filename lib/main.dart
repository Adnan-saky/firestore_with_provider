import 'package:firestore_with_provider/Provider/Product_Provider.dart';
import 'package:firestore_with_provider/Screens/products.dart';
import 'package:firestore_with_provider/Services/FireStore_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FireStoreService = new FireStore_Service();
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create:(context) => Product_Provider()),
        StreamProvider(create: (context) => FireStoreService.GetProduct()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Products(),
      ),
    );
  }
}

