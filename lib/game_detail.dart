import 'package:flutter/material.dart';
import 'widgets/glist.widgets.dart';

class GameDetail extends StatelessWidget {
  
  final Map handle;

  GameDetail(this.handle);

  @override
  Widget build(BuildContext context) {

    print(this.handle);

    return Scaffold(
      appBar: AppBar(
        title: Text(handle['name']),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Image.network(handle['image']['medium_url']),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: GListWidget.buildText(handle['name']),
              )
            ],
          )
        ],
      ),
    );
  }
}