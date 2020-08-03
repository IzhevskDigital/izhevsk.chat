import 'package:app/pages/Player.dart';
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
              onPressed: () => createPlaylist(context),
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
                    color: Colors.white,
                    height: 50,
                    width: 1000,
                    alignment: Alignment.center,
                    child: Text('Added albums',
                        style: TextStyle(fontSize: 40, color: Colors.black)),
                  ),
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () => openAlbum(context),
                              tooltip: 'Главный плейлист',
                              icon: Image.network(
                                  'https://avatanplus.com/files/resources/original/575af465131c91553b4aaad6.jpg'),
                              iconSize: 100,
                            ),
                            IconButton(
                              onPressed: () => openAlbum(context),
                              tooltip: 'Playlists $index',
                              iconSize: 100,
                              icon: Image.network(
                                  'https://avatars.yandex.net/get-music-content/118603/36b7d6e2.a.4440406-1/m1000x1000?webp=false'),
                            ),
                            IconButton(
                                onPressed: () => openAlbum(context),
                                tooltip: 'Playlists $index',
                                iconSize: 100,
                                icon: Icon(Icons.playlist_play)),
                            IconButton(
                              onPressed: () => createPlaylist(context),
                              tooltip: 'Add playlist',
                              iconSize: 100,
                              icon: Icon(Icons.playlist_add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 1000,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'My music',
                      style: TextStyle(fontFamily: 'Cookie', fontSize: 40),
                    ),
                  )
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

  void openPlayer(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Player();
      },
    ));
  }

  void createPlaylist(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Создать плейлист'),
          ),
          body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Новый плейлист',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
