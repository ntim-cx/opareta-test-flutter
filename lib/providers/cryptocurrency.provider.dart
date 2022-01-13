
import 'package:flutter/material.dart';
import 'package:opareta_test/constants/api.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/models/data.dart';

class CryptoCurrencyProvider with ChangeNotifier{

  List<Data> cryptoData;
  String amount ;
  String selectedCurrency;
  bool isLoading;

  initProvider(){
    cryptoData =[];
    amount ="0";
    selectedCurrency = AppString.currencyList.first;
    index();
  }

  index(){
    String url = "${Api.baseUrl}${Api.getCrypto}";
    setUIState(true);

    setUIState(false);

  }

  onChangeCurrency(String val){
    selectedCurrency = val;
    notifyListeners();
  }

  setUIState(bool loading){
    isLoading = loading;
    notifyListeners();
  }


}