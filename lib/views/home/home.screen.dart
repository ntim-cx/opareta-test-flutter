import 'package:flutter/material.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/constants/utils.dart';
import 'package:opareta_test/providers/cryptocurrency.provider.dart';
import 'package:opareta_test/shared_widgets/currency.widget.dart';
import 'package:opareta_test/shared_widgets/shimmer.widget.dart';
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

    final dropdown = Flexible(
        flex: 1,
        child: Container(
          color: Colors.grey.shade400,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButton(
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
          ),
        ));

    final textField = Flexible(
        flex: 3,
        child: TextFormField(
          keyboardType: TextInputType.number,
          maxLines: 1,
          controller: vm.amountCtrl,
          onChanged: (val) => vm.getCryptoList(),
          decoration: InputDecoration(
            fillColor: Colors.red,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.5),
            ),
            hintText: "Amount",
            enabledBorder: InputBorder.none,
            border:InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10.0,
            ),
          ),
        ));

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AMOUNT",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dropdown,
                    Utils.horizontalSpacer(),
                    textField,
                  ],
                ),
              ),
              Utils.verticalSpacer(space: 16),
              const Text(
                "CURRENCIES",
                style: TextStyle(fontSize: 12),
              ),
              currencyList,
            ],
          ),
        ),
      ),
    );
  }
}
