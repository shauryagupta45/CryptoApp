import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class GenericTile extends StatelessWidget {
  final String symbol;
  final String coinName;
  // final String iconSvg;
  final String price;
  final String percentChange24;

  GenericTile({
    required this.symbol,
    required this.coinName,
    // required this.iconSvg,
    required this.price,
    required this.percentChange24,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Container(
      //   width: 40,
      //   height: 40,
      //   child: SvgPicture.string(
      //     iconSvg,
      //     color: Colors.blue, // Change the color as needed
      //   ),
      // ),
      title: Text(symbol),
      subtitle: Text(coinName),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Text(
            percentChange24,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
