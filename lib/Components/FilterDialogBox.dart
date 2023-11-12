import 'package:flutter/material.dart';

import '../providerr.dart';

Future<dynamic> buildShowDialog(BuildContext context, OptionProvider value) {
  final List<String> options = [
    'MarketCap',
    'Price',
    'Volume_24h',
  ];
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((String option) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      // Handle the selected option
                      value.setOption(option);
                      Navigator.pop(context);
                    },
                    title: Text(
                      option,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (option == "MarketCap" || option == "Price")
                    Container(
                      alignment: Alignment.topLeft,
                      width: 340,
                      child: const Divider(
                        color: Color(0x7F0B0B0B),
                        height: 1,
                        thickness: 2,
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    },
  );
}
