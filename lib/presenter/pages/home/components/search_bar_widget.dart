import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.8),
          ),
          padding: EdgeInsets.only(left: 10),
          width: 500,
          height: 35,
          child: TextField(
            style: TextStyle(color: Color(0xffC7D5E0)),
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Color(0xffC7D5E0)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
