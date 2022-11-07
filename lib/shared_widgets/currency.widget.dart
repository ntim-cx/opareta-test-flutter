import 'package:flutter/material.dart';
import 'package:opareta_test/constants/utils.dart';
import 'package:opareta_test/models/quote.dart';

class CurrencyWidget extends StatelessWidget {
  final Color backgroundColor;
  final String symbol, name, amount;
  final Quote quote;

  const CurrencyWidget(
      {Key? key,
      required this.quote,
      required this.symbol,
      required this.name,
      required this.amount,
      required this.backgroundColor})
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symbol,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                getCryptoValue(quote, double.parse(amount)).toStringAsFixed(5),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                Utils.formatDateTime(quote.lastUpdated),
                style: const TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  double getCryptoValue(Quote quote, double amount) {
    return quote.price != null ? (quote.price! * amount) : 0.0;
  }
}
