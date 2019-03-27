import 'package:currenciesapp/currencyservice.dart';
import 'package:flutter/material.dart';

class InputWhitePage extends StatefulWidget {
  final origCurrency ; 
  final convCurenncy ;

  InputWhitePage({
    this.origCurrency,
    this.convCurenncy, 
  });
  @override
  _InputWhitePageState createState() => _InputWhitePageState();
}

class _InputWhitePageState extends State<InputWhitePage> {

  var currInput = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECFFF5),
      body: Column(
        children: <Widget>[
          SizedBox(height: 80.0,),
          InkWell(
            onTap: () {
              setState((){
                currInput=0;
              }) ;
            },
            child: Text('Tap to delete', 
            style: TextStyle(
              color : Color(0xFF29d17e),
              fontWeight:FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(currInput.toString(),
                style: TextStyle(
                color : Color(0xFF29d17e),
                fontWeight:FontWeight.bold,
                fontFamily: 'Quicksand',
                fontSize: 100.0,
              ),
            ),
          ),
          SizedBox(height: 25.0,),
          numberRow(1 , 2 , 3 ),
          SizedBox(height: 25.0,),
          numberRow(4 , 5 , 6 ),
          SizedBox(height: 25.0,),
          numberRow(7 , 8 , 9 ),
          SizedBox(height: 25.0,),
          finalRow(),
        ],
      ),
      
    );
  }
  Widget numberRow(num1, num2 , num3){
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(onTap: () {
          calculateNumber(num1); 
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
            child: Text(
            num1.toString(),
            style:TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          )
        ),
      ),
      InkWell(onTap: () {
          calculateNumber(num2); 
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
            child: Text(
            num2.toString(),
            style:TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
        ),
      ),
      InkWell(onTap: () {
        calculateNumber(num3);
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
            child: Text(
            num3.toString(),
            style:TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
        ),
      ),
      ],
    );
  }
  Widget finalRow(){
   return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(onTap: () {
          //calculateNumber(num1); 
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
           child: IconButton(
              icon: Icon(Icons.arrow_back , color: Color(0xFFE3FFF0),size: 25.0,),
              onPressed: (){
              Navigator.of(context).pop();
          },
            )
          )
        ),
      ),
      InkWell(onTap: () {
          calculateNumber(0); 
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
            child: Text(
            0.toString(),
            style:TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
        ),
      ),
      InkWell(onTap: () {
        CurrencyService().converCurrency(widget.convCurenncy, widget.origCurrency, currInput, context);
        },
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Color(0xFF29d17e),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ),
      ],
    );
  }
  void calculateNumber(num) {
    if (currInput==0){
      setState(() {
        currInput=num;
      });
    }
    else {
      setState(() {
        currInput = (currInput * 10) + num;
      });
    }
  }
}
