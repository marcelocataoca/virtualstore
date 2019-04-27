import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;

  double price;

  String title;
  String description;

  List images;
  List sizes;

  //passar os doc do firebase para armazenar os dados
  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    description = snapshot.data['description'];
    price = snapshot.data['price'];
    images = snapshot.data['images'];
    sizes = snapshot.data['sizes'];
  }
}