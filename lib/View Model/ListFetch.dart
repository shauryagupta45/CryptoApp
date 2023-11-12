import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_shaurya/Components/CryptoTile.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../Model/Model2.dart';
import '../constants.dart';

Future<Model2?> getCrypto() async {
  try {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'X-CMC_PRO_API_KEY': apiKey},
    );

    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> responseData = jsonDecode(response.body);

      // Parse the JSON data into a modelApi instance
      Model2 apiData = Model2.fromJson(responseData);
      return apiData;
    } else {
      throw Exception(
          'Failed to load data, status code: ${response.statusCode}');
    }
  } catch (e) {
    print(e.toString());
  }
}

Widget buildCryptoFutureBuilder() {
  return FutureBuilder<Model2?>(
    future: getCrypto(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      }
      if (!snapshot.hasData) {
        return const Text("No data available");
      }
      Model2? apiData = snapshot.data!;
      return buildCryptoList(apiData);
    },
  );
}

Widget buildCryptoList(Model2 apiData) {
  return ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      if (index == 0) {
        return const SizedBox.shrink();
      }

      String pricey =
          apiData.data![index].quote!.usd!.price!.toInt().toString();

      String percentShow = apiData.data![index].quote!.usd!.percentChange24h!
          .toDouble()
          .toStringAsFixed(2);

      return GenericTile(
        id: apiData.data![index].id.toString(),
        symbol: apiData.data![index].symbol.toString(),
        coinName: apiData.data![index].name.toString(),
        price: "\$$pricey USD",
        percentChange24: percentShow,
      );
    },
  );
}

Widget topCryptoBuilder() {
  return FutureBuilder<Model2?>(
    future: getCrypto(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      }
      if (!snapshot.hasData) {
        return const Text("No data available");
      }
      Model2? apiData = snapshot.data!;
      return topCrypto(apiData);
    },
  );
}

Widget topCrypto(Model2 apiData) {
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      if (index == 0) {
        // Display the first item differently
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust the borderRadius as needed
                child: CachedNetworkImage(
                  imageUrl:
                      "https://coinicons-api.vercel.app/api/icon/${apiData.data![index].symbol.toString().toLowerCase()}",
                  width: 50.0, // Adjust the width as needed
                  height: 50.0, // Adjust the height as needed
                  fit: BoxFit.cover, // Adjust the fit property as needed
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apiData.data![index].symbol.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    apiData.data![index].name.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${apiData.data![index].quote!.usd!.price!.toInt()} USD",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${apiData.data![index].quote!.usd!.percentChange24h!.toDouble().toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    },
  );
}
