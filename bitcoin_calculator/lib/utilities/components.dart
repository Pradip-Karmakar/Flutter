import 'package:flutter/material.dart';
import 'coin_data.dart';

class Components {

  List<DropdownMenuItem> getCurrencyList() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for(String currency in currenciesList) {
      var addItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(addItem);
    }
    return dropdownItems;
  }

  List<Widget> getCards(String currency, List<int> price) {
    List<Widget> currencyCards = [];
          for(int i = 0; i < cryptoList.length; i++) {
            var addCard = Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[i]} = ${price[i]} $currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
            currencyCards.add(addCard);
          }
          return currencyCards;
  }


}

