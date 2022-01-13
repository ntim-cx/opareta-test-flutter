import 'package:flutter/material.dart';
import 'package:opareta_test/shared_widgets/shimmer.widget.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/constants/utils.dart';
import 'package:opareta_test/providers/cryptocurrency.provider.dart';
import 'package:opareta_test/shared_widgets/currency.widget.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CryptoCurrencyProvider vm;

  @override
  void initState() {
    vm = context.read<CryptoCurrencyProvider>();
    vm.initProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vm = context.watch<CryptoCurrencyProvider>();

    final button = MaterialButton(
      onPressed: vm.getCryptoList,
      child: Text("Calculate"),
    );

    final dropdown = DropdownButton(
      underline: Container(),
      isExpanded: true,
      //hint: const Text("Amount"),
      value: vm.selectedOption,
      items: AppString.currencyList.map((item) {
        return DropdownMenuItem(
          child: Text(
            item,
          ),
          value: item,
        );
      }).toList(),
      onChanged: vm.onChangeCurrency,
    );

    final textField = TextFormField(
      keyboardType: TextInputType.number,
      maxLines: 1,
      controller: vm.amountCtrl,
      decoration: InputDecoration(
        isDense: false,
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.withOpacity(0.5),
        ),
        hintText: "Amount",
        enabledBorder: null,
        border: null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10.0,
        ),
      ),
    );

    final currencyList = Expanded(
      child: ListView.builder(
        itemCount: vm.isLoading ? 10 : vm.list?.length ?? 0,
        itemBuilder: (ctx, index) {
          return vm.isLoading
              ? const ShimmerWidget()
              : CurrencyWidget(
                  backgroundColor:
                      index.isEven ? Colors.grey.shade100 : Colors.white,
                  symbol: vm.list[index].symbol,
                  name: vm.list[index].name,
                  amount: vm.amount,
                  quote: vm.list[index].quote[vm.selectedOption],
                );
        },
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amount"),
              Utils.verticalSpacer(space: 8),
              dropdown,
              textField,
              button,
              Flexible(
                child: Row(
                  children: [
                    Utils.horizontalSpacer(),
                  ],
                ),
              ),
              Utils.verticalSpacer(space: 16),
              currencyList,
            ],
          ),
        ),
      ),
    );
  }
}
