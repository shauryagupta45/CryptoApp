import 'package:crypto_shaurya/Components/CryptoTile.dart';
import 'package:crypto_shaurya/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Components/SearchBar.dart';
import '../View Model/ListFetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? sortByOption;
  bool hasNotification = true;
  final searchBarController = TextEditingController();

  // List<CryptoModel> CryptoList = [];

  // Future<List<CryptoModel>> getCrypto() async {
  //   CryptoList.clear();
  //   try {
  //     final response = await http.get(
  //       Uri.parse(baseUrl),
  //       headers: {'X-CMC_PRO_API_KEY': apiKey},
  //     );
  //     var data = jsonDecode(response.body.toString());
  //     if (response.statusCode == 200) {
  //       // Check if 'data' key is present in the response
  //       if (data.containsKey('data')) {
  //         for (Map i in data['data']) {
  //           CryptoModel coin = CryptoModel(data: i['data']);
  //           CryptoList.add(coin);
  //         }
  //         print("response successful");
  //         return CryptoList;
  //       } else {
  //         print('Missing data key in the response');
  //       }
  //     } else {
  //       print('response unsuccessful');
  //       print('Status code: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //     print("Tried but not successful");
  //   }
  //
  //   return CryptoList;
  // }

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
                searchBar(searchBarController),
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
                      child: const Row(
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
                  const Text(
                    "Cryptocurrency",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: Color(0xFF0A0A0A)),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 317,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0x1900CE08),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Stack(
                  children: [
                    topCryptoBuilder(),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.string(svgGraphTop),
                          // ClipPath(
                          //   clipper: MyCustomClipper(),
                          //   child: Container(
                          //     height: 70,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
            Expanded(child: buildCryptoFutureBuilder()),
          ],
        ),
      ),
    );
  }
}
