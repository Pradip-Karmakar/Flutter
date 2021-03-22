import 'package:bitcoin_calculator/services/pricing.dart';
import 'package:flutter/material.dart';
import '../utilities/components.dart';
import '../utilities/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  List<int> selectedCurrencyPrice = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Components().getCards(selectedCurrency,selectedCurrencyPrice),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurrency,
              items: Components().getCurrencyList(),
              onChanged: (value) async {
                List<int> getData = [];
                for(String crypto in cryptoList) {
                   int price = await Price().getCryptoPrice(crypto,value);
                   getData.add(price);
                }
                setState(()  {
                  selectedCurrency = value;
                  selectedCurrencyPrice = getData;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
