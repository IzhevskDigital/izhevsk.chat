import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);
  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          LinearProgressIndicator(
            value: 100.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
          ),
          IconButton(
            icon: Icon(Icons.repeat),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.local_play),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
