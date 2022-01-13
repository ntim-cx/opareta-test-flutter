import 'package:flutter/material.dart';

enum UiState { idle, loading, done, error }

class BaseCryptoCurrencyProvider with ChangeNotifier {
  Future index(){}

  void initProvider() {}

  void reset() {}

  UiState uiState = UiState.idle;

  // Getters
  get isLoading => uiState == UiState.loading;

  get isDone => uiState == UiState.done;

  get hasError => uiState == UiState.error;

  // Functions
  void setUiState(UiState _uiState) {
    uiState = _uiState;
    notifyListeners();
  }
}