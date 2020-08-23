import 'package:app/Theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/music/time.dart';
import 'package:app/music/autor.dart';
import 'package:app/music/song.dart';
import 'package:app/pages/Chat.dart';

class ButtonTrack extends StatefulWidget {
  _StateButtonTrack createState() => _StateButtonTrack();
}

class _StateButtonTrack extends State<ButtonTrack> {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: RaisedButton(
        focusColor: Colors.amber[800],
        textTheme: ButtonTextTheme.primary,
        color: Colors.white,
        onPressed: () => playMusic(),
        child: ListTile(
          leading: Icon(Icons.play_arrow),
          title: Text(
            song.getNameSong(),
            style: buttonText,
          ),
          trailing: Text(time.getTime(), style: buttonText),
          subtitle: Row(children: <Widget>[
            Text(autor.getNameAutor()),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.chat),
              iconSize: iconSize,
              onPressed: () => chat.openChat(),
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.add),
              iconSize: iconSize,
              onPressed: () => song.addTrack(),
            ),
          ]),
          isThreeLine: true,
          onTap: playMusic(),
          enabled: false,
        ),
      ),
    );
  }

  playMusic() {}
}
