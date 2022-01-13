import 'package:flutter/material.dart';
import 'package:opareta_test/shared_widgets/shimmer.widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:opareta_test/constants/app_string.dart';
import 'package:opareta_test/constants/utils.dart';
import 'package:opareta_test/providers/cryptocurrency.provider.dart';
import 'package:opareta_test/shared_widgets/currency.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CryptoCurrencyProvider vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = CryptoCurrencyProvider();
    vm.initProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text("Amount"),
              Utils.verticalSpacer(space: 8),
              Row(
                children: [
                  DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    hint: const Text("Amount"),
                    value: AppString.currencyList.first,
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
                  Utils.horizontalSpacer(),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                      isDense: false,
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
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
                  )
                ],
              ),
              Utils.verticalSpacer(space: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: vm.isLoading ? 10 : vm.cryptoData.length,
                  itemBuilder: (ctx, index) {
                    return vm.isLoading
                        ? const ShimmerWidget()
                        : CurrencyWidget(
                            backgroundColor: index.isEven
                                ? Colors.grey.shade100
                                : Colors.white,
                            quote:
                                vm.cryptoData[index].quote[vm.selectedCurrency],
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
