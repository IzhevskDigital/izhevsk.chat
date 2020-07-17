import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Music', style: TextStyle(fontSize: 50, fontFamily: 'Cookie')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'Добавить плейлист',
            onPressed: () => openPlaylistAdd(context),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(child: Text('Added albums')),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text('Playlists'),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text('Music'),
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  void openPlaylistAdd(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Новый плейлист'),
          ),
          body: Center(
            child: Text(
              'Новый плейлист',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}
