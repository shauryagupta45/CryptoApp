// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
//
// class GenericTile extends StatelessWidget {
//   final String symbol;
//   final String coinName;
//   // final String iconSvg;
//   final String price;
//   final String percentChange24;
//
//   GenericTile({
//     required this.symbol,
//     required this.coinName,
//     // required this.iconSvg,
//     required this.price,
//     required this.percentChange24,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       // leading: Container(
//       //   width: 40,
//       //   height: 40,
//       //   child: SvgPicture.string(
//       //     iconSvg,
//       //     color: Colors.blue, // Change the color as needed
//       //   ),
//       // ),
//       title: Text(symbol,
//           style: const TextStyle(
//               fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Inter')),
//       subtitle: Text(coinName,
//           style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFFBDBDBD),
//               fontFamily: 'Inter')),
//       trailing: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             price,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
//           ),
//           Text(
//             percentChange24,
//             style: TextStyle(
//               fontSize: 13.0,
//               fontWeight: FontWeight.w500,
//               color: double.parse(percentChange24) < 0
//                   ? Color(0xFFFF3D00)
//                   : Color(0xFF00CE08),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:crypto_shaurya/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class GenericTile extends StatelessWidget {
  final String id;
  final String symbol;
  final String coinName;
  final String price;
  final String percentChange24;

  GenericTile({
    required this.id,
    required this.symbol,
    required this.coinName,
    required this.price,
    required this.percentChange24,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(8.0), // Adjust the borderRadius as needed
            child: CachedNetworkImage(
              imageUrl:
                  "https://coinicons-api.vercel.app/api/icon/${symbol.toLowerCase()}",
              width: 50.0, // Adjust the width as needed
              height: 50.0, // Adjust the height as needed
              fit: BoxFit.cover, // Adjust the fit property as needed
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      title: Row(
        children: [
          Text(symbol,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter')),
          const SizedBox(width: 16.0),
          if (double.parse(percentChange24) < 0)
            SvgPicture.string(
              lossSVG,
              // replace with your SVG1 code
            )
          else
            SvgPicture.string(
              profitSVG, // replace with your SVG2 code
            ),
        ],
      ),
      subtitle: Text(coinName,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFFBDBDBD),
              fontFamily: 'Inter')),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          const SizedBox(height: 4.0), // Adjust the spacing
          Text(
            percentChange24,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: double.parse(percentChange24) < 0
                  ? Color(0xFFFF3D00)
                  : Color(0xFF00CE08),
            ),
          ),
        ],
      ),
    );
  }
}
// class GenericTile extends StatelessWidget {
//   final String symbol;
//   final String coinName;
//   final String price;
//   final String percentChange24;
//
//   GenericTile({
//     required this.symbol,
//     required this.coinName,
//     required this.price,
//     required this.percentChange24,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var cryptoIconsUrl = "https://cryptoicons.org/api/color/";
//     var size = "128";
//     return ListTile(
//       leading: Column(
//         children: [
//           CachedNetworkImage(
//             imageUrl: "$cryptoIconsUrl${symbol.toLowerCase()}/$size",
//             placeholder: (context, url) => CircularProgressIndicator(),
//             errorWidget: (context, url, error) => const Text("\$",
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//           ),
//           const SizedBox(width: 20.0)
//         ],
//       ),
//       title: Row(
//         children: [
//           Text(symbol,
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'Inter')),
//           const SizedBox(width: 16.0),
//           if (double.parse(percentChange24) < 0)
//             SvgPicture.string(
//               lossSVG,
//               // replace with your SVG1 code
//             )
//           else
//             SvgPicture.string(
//               profitSVG, // replace with your SVG2 code
//             ),
//         ],
//       ),
//       subtitle: Text(coinName,
//           style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFFBDBDBD),
//               fontFamily: 'Inter')),
//       trailing: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             price,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
//           ),
//           const SizedBox(height: 4.0), // Adjust the spacing
//           Text(
//             percentChange24,
//             style: TextStyle(
//               fontSize: 13.0,
//               fontWeight: FontWeight.w500,
//               color: double.parse(percentChange24) < 0
//                   ? Color(0xFFFF3D00)
//                   : Color(0xFF00CE08),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
