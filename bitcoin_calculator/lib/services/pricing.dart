import 'networking.dart';

const apiKey = '10983626-F77B-45BE-8EF6-52190BC63F12';
const priceApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class Price {
  double doublePrice;
  Future<int> getCryptoPrice(String crypto, String currency) async {
      BitcoinNetwork bitcoinNetwork = BitcoinNetwork('$priceApiUrl/$crypto/$currency?apikey=$apiKey');
      dynamic bitcoinData = await bitcoinNetwork.getData();
      if(bitcoinData['rate'] == null) {
        doublePrice = 0;
      }
      else {
        doublePrice = bitcoinData['rate'];
      }
    return doublePrice.toInt();
  }
}