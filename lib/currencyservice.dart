import 'package:currenciesapp/dashboard.dart';
import 'package:flutter/material.dart';

class CurrencyService {
  getCurrencyString(currency){
    if(currency == 'USD') return 'United States Dollar'; 
    if(currency == 'RUB') return 'Russian Ruble'; 
    if (currency== 'JPY') return 'Japanese Yen';
    if (currency == 'DZN') return 'Algerian Dinar';
    if (currency == 'GBP') return 'Pound Sterling';
    if (currency == 'EUR') return 'Euro';
    if (currency == 'CHF') return 'Swiss Franc';
    if (currency == 'KRW') return 'South Korean Won';
    if (currency == 'ILS') return 'Israeli Shekel';
  }
  
  converCurrency (String fromCurrency , String toCurrency , int ammount , context){
    if  (fromCurrency=='USD') {
      switch (toCurrency) {
        case'RUB':
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
            currencyVal: ammount,
            convertedCurrency: (ammount * 65).roundToDouble(),
            currencyone: fromCurrency,
            currencytwo: toCurrency,
            isWhite: false,
          )
        ));
          break;
        default:
      }
    }
    if  (fromCurrency=='RUB') {
      switch (toCurrency) {                                                                                                 
        case'USD':
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(
            currencyVal:(ammount / 65).toStringAsFixed(2) ,
            convertedCurrency :ammount,
            currencyone: toCurrency,
            currencytwo: fromCurrency,
            isWhite: true,
          )
        ));
          break;
        default:
      }
    }
  }
}