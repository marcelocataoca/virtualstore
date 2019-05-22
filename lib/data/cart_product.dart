import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/data/product_data.dart';

class CartProduct{

  String cid;

  String category;
  String pid;

  int quantity;
  String size;

  ProductData productData;
  //product add no carrinho

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  //para add no bd é preciso transfomar em um mapa
  Map<String, dynamic> toMap(){
    return{
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      //resumo dos produtos, os dados mais relevantes do produto
      "product": productData.toResumedMap()
    };
  }
}