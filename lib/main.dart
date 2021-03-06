import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/models/cart_model.dart';

void main(){
  runApp( new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      //quais partes do app vão ser modificadas pelo usermodel
        model: UserModel(),
        //scopedmodel do carrinho para conseguir acessar  o modelo do cart
        //ScopedModelDescendant para carregar outro carrinho na troca de usuario
        child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return ScopedModel<CartModel>(
                model: CartModel(model),
                child: MaterialApp(
                    title: "Loja virtual - leve sempre",
                    //caso tenha problema com o mode debug, alterar o main inserindo o new
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      //primaryColor: Color.fromARGB(225, 4, 125, 141)
                      primaryColor: Colors.purple,
                    ),
                    home:HomeScreen()
                ),
              );
            })
    );
  }
}

