import 'package:currenciesapp/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF29d17e),
      appBar: AppBar(
        backgroundColor: Color(0xFF29d17e),
        elevation: 0.0,
        leading:  IconButton(
          icon: Icon(Icons.arrow_back, color : Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    body: ListView(
      children: <Widget>[ 
        getListItem('Russian Ruble' , 'RUB'),
        getListItem('United States Dollar' , 'USD'),
        getListItem('Japanese Yen' , 'JPY'),
        getListItem('Algerian Dinar' , 'DZN'),
        getListItem('Pound Sterling' , 'GBP'),
        getListItem('Euro' , 'EUR'),
        getListItem('Swiss Franc' , 'CHF'),
        getListItem('South Korean Won' , 'KRW'),
        getListItem('Israeli Shekel' , 'ILS'),

      ],
    ),
    );
  }
  
  Widget getListItem(String currencyName, String currency){
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute (
          builder: (context) => DashboardPage(currencyVal: 0.0, isWhite: false, convertedCurrency: 0.0, currencyone: 'USD', currencytwo: currency,)
        ));
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25.0 , bottom: 20.0),
            child: Text(currencyName, 
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFFccffe5),
            ),),
          ),
          SizedBox(width: 10.0,),
          Padding(
            padding: EdgeInsets.only(right: 25.0 , bottom: 20.0),
            child: Text('"'+currency+'"', 
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFFccffe5),
            ),),
          ),
        ],
      ),
    );

  }
}