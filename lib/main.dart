import 'package:flutter/material.dart';
import 'widgets/glist.widgets.dart';
import 'game_detail.dart';
import 'package:dio/dio.dart';
import 'dart:async';

const request = 'https://www.giantbomb.com/api/games/?api_key=ae238a0cd01c7501ae9098936621727a2011d66c&format=json';



void main(){
  runApp(MaterialApp(
    title: 'Game List',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List games = [];

  TextEditingController nameCtrl = TextEditingController();


  Future<List> getData(String name) async{
    Response response = await Dio().get("$request&filter=name:${name.split(" ").join("%")}");
    return response.data['results'];
  }


  void searchGame(String text) async{
    List games = await getData(text);
    
    setState(() => this.games = games);
  }

  Widget displayHome(){
    bool isEmpty = games.length == 0;

    if (isEmpty) {
      return Container(
        padding: EdgeInsets.only(top: 50),
        child: Text('your game list is empty!!', 
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.pink),
        ),
      );
    }else {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => GListWidget.buildList(context, index, games, (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => GameDetail(games[index])
            ));
          }),
          itemCount: games.length
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GListWidget.buildAppBar("Game List"),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Game name",
                      labelStyle: TextStyle(color: Colors.pink),
                      hoverColor: Colors.pink
                    ),
                    controller: nameCtrl,
                    onChanged: searchGame,
                  ),
                ),
              ],
            ),
            Container(
              child: displayHome()
            )
          ],
        ),
      )
    );
  }
}