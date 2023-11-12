import 'package:flutter/material.dart';

Widget searchBar(TextEditingController searchBarController) {
  return Expanded(
    child: TextFormField(
      controller: searchBarController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0x0C0A0A0A),
        hintText: "Search Cryptocurrency",
        hintStyle: TextStyle(color: Color(0x4C0A0A0A)),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8.0), // Adjust the left padding
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
              color: Colors.grey), // Set the border color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
              color: Colors.grey), // Set the border color when not focused
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 1.5, horizontal: 3.0),
      ),
    ),
  );
}
