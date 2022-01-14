import 'package:opareta_test/providers/cryptocurrency.provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CryptoCurrencyProvider>.value(
    value: CryptoCurrencyProvider(),
  ),
];
