import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cryptoapp/HomePage.dart';
import 'package:flutter/material.dart';
void main() async{
   List currencies = await getCurrency();
   print(currencies);
   runApp(new MyApp(currencies));
   }

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme:
      new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100]:null
        ),
      home: new HomePage(
        _currencies
      ),
    );
  }
}
Future<List> getCurrency() async{
      String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
      http.Response response = await http.get(cryptoUrl);
      return JSON.decode(response.body);
    }