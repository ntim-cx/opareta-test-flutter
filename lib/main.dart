import 'package:flutter/material.dart';
import 'package:opareta_test/providers/BaseCryptoCurrencyProvider.dart';
import 'package:opareta_test/providers/cryptocurrency.provider.dart';
import 'package:opareta_test/views/home/home.screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseCryptoCurrencyProvider>.value(
          value: BaseCryptoCurrencyProvider(),
        ),
        ChangeNotifierProvider<CryptoCurrencyProvider>.value(
          value: CryptoCurrencyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Opareta Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
