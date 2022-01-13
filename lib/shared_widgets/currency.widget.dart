import 'package:flutter/material.dart';
import 'package:opareta_test/models/quote.dart';

class CurrencyWidget extends StatelessWidget {
  final Color backgroundColor;
  final String symbol, name, amount;
  final Quote quote;

  const CurrencyWidget(
      {Key key,
      this.quote,
      this.symbol,
      this.name,
      this.amount,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                symbol,
              ),
              Text(
                name,
              )
            ],
          ),
          Column(
            children: [
              Text(
                getCryptoValue(quote, double.parse(amount)).toString(),
              ),
              Text(
                quote.lastUpdated,
              )
            ],
          )
        ],
      ),
    );
  }

  double getCryptoValue(Quote quote, double amount) {
    return quote.price * amount;
  }
}
