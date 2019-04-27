import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/tile/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").getDocuments(),
        builder: (context, snapshot) {
          //Caso não carregou as categorias, mostra uma animação de loading
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var dividedTiles = ListTile.divideTiles(
                    tiles: snapshot.data.documents.map((doc) {
                      return CategoryTile(doc);
                    }).toList(),
                    color: Colors.grey[500])
                .toList();
            return ListView(
              //page cada documento, substitui por um categoryTile e retorna em uma lista novamente
              children: dividedTiles,
            );
          }
        });
  }
}
