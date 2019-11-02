import 'package:flutter/material.dart';

class GListWidget {
  static Widget buildAppBar(String title){
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.pink,
      centerTitle: true,
    );
  }

  static Widget buildList(BuildContext context, int index, handle, cb){
    return ListTile(
      title: Text(handle[index]['name']),
      onTap: cb,
    );
  }

  static Widget buildText(String text, {TextStyle textStyle}) {
    return Text(
      text,
      style: textStyle != null ? textStyle : TextStyle(
        color: Colors.pink
      ),
    );
  }
}