import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final VoidCallback onSearch;
  final TextEditingController keywordController;

  SearchBar({
    @required this.onSearch,
    @required this.keywordController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: keywordController,
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearch,
        )
      ],
    );
  }
}
