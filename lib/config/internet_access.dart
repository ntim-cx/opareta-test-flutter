import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetAccess {
  static final InternetAccess _singleton = new InternetAccess._internal();

  InternetAccess._internal();

  static InternetAccess getInstance() => _singleton;
  bool hasInternetConnection;

  StreamController connectionChangeController = StreamController();
  final Connectivity _connectivity = Connectivity();
  Function action;

  //final router = locator<RouterService>();

  void initialize(Function function) {
    hasInternetInternetConnection();
    action = function;
    _connectivity.onConnectivityChanged.listen((_connectionChange));
  }

  void _connectionChange(ConnectivityResult result) =>
      hasInternetInternetConnection();

  Stream get connectionChange => connectionChangeController.stream;

  Future<bool> hasInternetInternetConnection() async {
    bool previousConnection = hasInternetConnection;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // this is the different
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          if (hasInternetConnection != null && !hasInternetConnection) {
            // Todo use internet to get crypto results
            action(!hasInternetConnection);
          }
          hasInternetConnection = true;
          //router.goBack();
          //print(true);
        } else {
          print(hasInternetConnection);
          routeToNoConnection();
        }
      } on SocketException catch (_) {
        routeToNoConnection();
      }
    } else {
      routeToNoConnection();
    }

    if (previousConnection != hasInternetConnection) {
      connectionChangeController.add(hasInternetConnection);
    }
    return hasInternetConnection;
  }

  void dispose() {
    connectionChangeController.close();
    connectionChangeController = StreamController();
  }

  routeToNoConnection() {
    if (hasInternetConnection != null && hasInternetConnection) {
      //todo use local storage when getting crypto
      action(!hasInternetConnection);
    }
    hasInternetConnection = false;
  }
}
