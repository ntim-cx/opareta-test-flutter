import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:opareta_test/constants/api.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/models/api_response.dart';
import 'package:opareta_test/models/crypto_response.dart';
import 'package:opareta_test/models/data.dart';
import 'package:opareta_test/providers/BaseCryptoCurrencyProvider.dart';
import 'package:opareta_test/services/http.services.dart';




class CryptoCurrencyProvider extends BaseCryptoCurrencyProvider {
  TextEditingController amountCtrl = TextEditingController();
  // Variables
  String selectedOption, amount;
  List<Data> list, liveList;
  var http = HttpService();

  @override
  initProvider() async {
    reset();
    return super.initProvider();
  }

  @override
  reset() {
    list = [];
    liveList =[];
    amount = "1";
    amountCtrl.text = amount;
    selectedOption = AppString.currencyList.first;
  }

  @override
  Future index() async {
    String url = "${Api.baseUrl}${Api.getCrypto}";
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setUiState(UiState.loading),
    );
    var params = {"limit": 20};
    var response = await http.get(url, queryParameters: params);
    setUiState(UiState.done);
    var apiResponse = ApiResponse.parse(response);
    log(apiResponse.code.toString());

    if (apiResponse.success) {
      var data = apiResponse.mappedData;
      var cryptoResponse = CryptoResponse.fromJson(data);
      if (cryptoResponse != null && cryptoResponse.data != null) {
        liveList = cryptoResponse.data;
      }
    }
  }

  onChangeCurrency(String val) {
    selectedOption = val;
    getCryptoList();
    notifyListeners();
  }

  void getCryptoList() {
    amount = amountCtrl.text;
    list = liveList;
    notifyListeners();
  }
}
