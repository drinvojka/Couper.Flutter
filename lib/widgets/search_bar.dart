import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    @required this.hint,
    this.suffixIcon , 
    this.onChanged
  }) : super(key: key);

  final EdgeInsets margin;
  final String hint;
  final IconData suffixIcon;
  final Function onChanged;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search),
          SizedBox(width: 13),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
                border: InputBorder.none,
                suffixIcon: suffixIcon != null ? new Icon(suffixIcon) : null,
              ),
            onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
