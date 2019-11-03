import 'package:flutter/material.dart';
import 'widgets/glist.widgets.dart';
import 'services/file_percistence.dart';

class GameDetail extends StatelessWidget {
  
  final Map handle;

  GameDetail(this.handle);

  @override
  Widget build(BuildContext context) {

    print(this.handle);

    return Scaffold(
      appBar: GListWidget.buildAppBar(handle['name']),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Image.network(handle['image']['medium_url']),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GListWidget.buildText(handle['deck'] ?? '')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}