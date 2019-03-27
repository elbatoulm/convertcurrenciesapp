import 'package:currenciesapp/currencylist.dart';
import 'package:currenciesapp/currencyservice.dart';
import 'package:currenciesapp/purple_input.dart';
import 'package:currenciesapp/white_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final currencyVal;
  final convertedCurrency;
  final currencyone;
  final currencytwo;
  final isWhite;

  DashboardPage(
    {
    this.currencyVal,
    this.currencyone,
    this.currencytwo,
    this.convertedCurrency,
    this.isWhite,
  }
  );

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF29d17e),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70),
                  InkWell( 
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) =>  CurrencyList()
                      ));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencyone),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontFamily: 'Quicksand'
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  SingleChildScrollView (
                    scrollDirection: Axis.horizontal,
                    child: InkWell( 
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputPurplePage(
                          origCurrency: widget.currencyone,
                          convCurenncy: widget.currencytwo,
                        )
                      ));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                        fontFamily: 'Quicksand'
                      ),
                    ),
                  ),
                  ),
                  Text(widget.currencyone,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 60.0,),
                  Container(
                    height: 125.0, 
                    width: 125.0, 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.5),
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF66FFB2),
                        style: BorderStyle.solid,
                        width: 5.0,
                      ) 
                    ),
                    child: Center(
                      child: widget.isWhite ?
                      Icon(
                        Icons.arrow_upward,
                        size: 60.0,
                        color: Color(0xFF54D192),
                      ):
                      Icon(
                        Icons.arrow_downward,
                        size: 60.0,
                        color: Color(0xFF54D192),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(widget.currencytwo,
                    style: TextStyle(
                      color: Color(0xFF29d17e),
                      fontSize: 30.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  SizedBox(height: 10.0,),
                  SingleChildScrollView (
                    scrollDirection: Axis.horizontal,
                    child: InkWell( 
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>InputWhitePage(
                          origCurrency: widget.currencyone  ,
                          convCurenncy: widget.currencytwo,
                        )
                      ));
                    },
                    child: Text(
                      widget.convertedCurrency.toString(),
                      style: TextStyle(
                        color: Color(0xFF29d17e),
                        fontSize: 100.0,
                        fontFamily: 'Quicksand'
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 20.0,),
                  InkWell( 
                    onTap: () {},
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencytwo),
                      style: TextStyle(
                        color: Color(0xFF29d17e),
                        fontSize: 28.0,
                        fontFamily: 'Quicksand'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}