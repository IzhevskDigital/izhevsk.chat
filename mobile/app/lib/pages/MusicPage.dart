import 'package:flutter/material.dart';
import 'package:app/pages/album.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_add),
              tooltip: 'Добавить плейлист',
              onPressed: () => openPlaylistAdd(context),
            ),
          ],
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Music',
                style: TextStyle(fontSize: 50, fontFamily: 'Cookie')),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    child: Text('Added albums', style: TextStyle(fontSize: 40)),
                  ),
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Row(children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () => null,
                        child: Text('Главный плейлист'),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () => null,
                        child: Text('Playlists $index'),
                      ),
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () => null,
                        child: Text('Playlists $index'),
                      ),
                    ]),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.centerRight,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () => null,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(' $index ', style: textStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(nameSong + ' ', style: textStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(autor + ' ', style: textStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(timer + ' ', style: textStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
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
