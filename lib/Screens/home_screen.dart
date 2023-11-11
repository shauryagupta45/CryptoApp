import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/CryptoModel.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? sortByOption;
  bool hasNotification = true;
  final searchBarController = TextEditingController();
  String apiKey = "1c9724a4-89fd-492b-8603-843f32a3e400";
  String baseUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  List<CryptoModel> CryptoList = [];

  Future<List<CryptoModel>> getCrypto() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {'X-CMC_PRO_API_KEY': apiKey},
      );

      print("hello");
      var data = jsonDecode(response.body.toString());
      print("2");

      if (response.statusCode == 200) {
        print("3");

        // Check if 'data' key is present in the response
        if (data.containsKey('data')) {
          for (Map i in data['data']) {
            CryptoModel coin =
                CryptoModel(status: i['status'], data: i['data']);
            CryptoList.add(coin);
          }
          print("response successful");
          return CryptoList;
        } else {
          print('Missing data key in the response');
        }
      } else {
        print('response unsuccessful');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print("Exception: $e");
      print("Tried but not successful");
    }

    return CryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EXCHANGE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 25.0,
                ),
                onPressed: () {
                  // Function for icon 1 onTap
                  print('Icon 1 tapped!');
                  setState(() {
                    hasNotification = false; // Reset notification status
                  });
                },
              ),
              if (hasNotification)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
              onPressed: () {
                print("Icon2 tapped");
                setState(() {});
              },
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 25.0,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchBarController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x0C0A0A0A),
                      hintText: "Search Cryptocurrency",
                      hintStyle: TextStyle(color: Color(0x4C0A0A0A)),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                            left: 8.0), // Adjust the left padding
                        child: Icon(
                          Icons.search_outlined,
                          color: Color(0x4C0A0A0A),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Set the border color when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Set the border color when not focused
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1.5, horizontal: 3.0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 46.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list, color: Color(0x4C0A0A0A)),
                          SizedBox(width: 10.0),
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: Color(0x4C0A0A0A),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Cryptocurrency",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: Color(0xFF0A0A0A)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    child: Text(
                      "NFT",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22.0,
                          fontFamily: 'Inter',
                          color: Colors.grey[300]),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Container(height: 50.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'Top Cryptocurrencies',
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0x7F0B0B0B),
                        fontSize: 15.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getCrypto(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: CryptoList.length,
                        itemBuilder: (context, index) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text("No Data Received"),
                            );
                          } else {
                            return ListTile(
                              title: Text(CryptoList[index]
                                      .data![index]
                                      .name
                                      .toString() ??
                                  ""),
                            );
                          }
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
