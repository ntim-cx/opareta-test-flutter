class InternetAccess {
  /*static final InternetAccess _singleton = new InternetAccess._internal();

  InternetAccess._internal();

  static InternetAccess getInstance() => _singleton;
  bool hasInternetConnection;

  StreamController connectionChangeController = StreamController();
  final Connectivity _connectivity = Connectivity();
  final router = locator<RouterService>();

  void initialize() {
    hasInternetInternetConnection();
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
          if (hasInternetConnection != null && !hasInternetConnection)
            router.goBack();
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
    if (hasInternetConnection != null && hasInternetConnection)
      router.navigateTo(AppRoutes.noInternetRoute);
    hasInternetConnection = false;
  }*/
}
