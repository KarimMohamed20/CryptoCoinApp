import 'package:cryptoapp/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.red];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: new AppBar(
        title: new Text("Cryptocoin Prices"),
        centerTitle: defaultTargetPlatform == TargetPlatform.iOS ? false : true,
       // backgroundColor: Colors.black,
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ), 
      body: _cryptoCoinApp(),
    );
  }
  Widget _cryptoCoinApp(){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index){
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency,color);
              },
            ),
          ),
        ],
      )
    );
  }
  Widget _getListItemUi(Map currency, MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency["name"][0]),
      ),
      title: new Text(currency['name'],
      style: new TextStyle(fontWeight: FontWeight.bold),),
      subtitle: _getSubtitle(currency['price_usd'],currency["percent_change_1h"]),
      isThreeLine: true,
    );
  }
  Widget _getSubtitle(String priceUSD,String percentChange1H){
    TextSpan priceWidget = new TextSpan(text: "\$$priceUSD\n",style: new TextStyle(
      color: Colors.black
    ));
    String  pricePercent = "1 hour: $percentChange1H%";
    TextSpan percentWidget;
    if(double.parse(percentChange1H)>0){
      percentWidget = new TextSpan(
        text: pricePercent,
        style: new TextStyle(
          color: Colors.green
        ),
        );
}
else{
  percentWidget = new TextSpan(
    text: pricePercent,
    style: new TextStyle(color: Colors.red),
    );
    }
    return new RichText(
      text: new TextSpan(
        children: [priceWidget,percentWidget]
  ),
    );
     }
    }
