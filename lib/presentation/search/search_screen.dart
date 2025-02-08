import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Explore",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                ),
                  _searchSection(context),
              ],
            ),
          ),
        ),
      )
    );
  }
  Container _searchSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).cardColor),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              hintText: 'Search recipes...',
              fillColor: Theme.of(context).cardColor,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  borderSide: BorderSide.none),
            ),
          )),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}