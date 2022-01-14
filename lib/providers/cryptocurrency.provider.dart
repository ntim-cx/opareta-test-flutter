import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:opareta_test/constants/api.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/constants/utils.dart';
import 'package:opareta_test/models/api_response.dart';
import 'package:opareta_test/models/crypto_response.dart';
import 'package:opareta_test/models/data.dart';
import 'package:opareta_test/providers/BaseCryptoCurrencyProvider.dart';
import 'package:opareta_test/services/http.services.dart';
import 'package:opareta_test/services/sql.service.dart';

class CryptoCurrencyProvider extends BaseCryptoCurrencyProvider {
  TextEditingController amountCtrl = TextEditingController();

  // Variables
  String selectedOption, amount;
  List<Data> list, liveList, localList;
  var http = HttpService();
  var sqlService = SqlService();

  @override
  initProvider() async {
    reset();
    index();
    return super.initProvider();
  }

  @override
  reset() {
    list = [];
    liveList = [];
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
    var params = {"limit": 20, "convert": AppString.currencies};
    var response = await http.get(url, queryParameters: params);
    setUiState(UiState.done);
    var apiResponse = ApiResponse.parse(response);
    log(apiResponse.code.toString());

    if (apiResponse.success) {
      var data = apiResponse.mappedData;
      var cryptoResponse = CryptoResponse.fromJson(data);
      if (cryptoResponse != null && cryptoResponse.data != null) {
        liveList = cryptoResponse.data;
        sqlService.insertCrypto(cryptoResponse);
      }
    }
  }

  getNotesFromLocal() async {
    var res = await sqlService.readCrypto();
    bool isValid = Utils.checkDataValidity(res.status.timestamp);
    if (isValid) {
      localList = res.data;
      return;
    }
    localList = [];
  }

  onChangeCurrency(String val) {
    selectedOption = val;
    getCryptoList();
    notifyListeners();
  }

  void getCryptoList() {
    amount = amountCtrl.text;
    if (amount == null || amount.isEmpty) {
      amount = "0";
    }
    list = liveList;
    notifyListeners();
  }
}
