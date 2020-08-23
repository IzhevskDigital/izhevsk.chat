import 'package:app/Theme/constants.dart';
import 'package:app/pages/Player.dart';
import 'package:flutter/material.dart';
import 'package:app/buttons/buttonAlbum.dart';
import 'package:app/buttons/buttonTrack.dart';

ButtonAlbum buttonAlbum = ButtonAlbum();
//Начальные альбомы у всех пользователей
List<Widget> albumList = <Widget>[
  Row(
    children: <Widget>[
      ButtonAlbum.forImage(
          'Oxxxymiron',
          'https://avatanplus.com/files/resources/original/575af465131c91553b4aaad6.jpg',
          albumSize),
      ButtonAlbum.forImage(
          'Imagine Dragons',
          'https://avatars.yandex.net/get-music-content/118603/36b7d6e2.a.4440406-1/m1000x1000?webp=false',
          albumSize),
      ButtonAlbum.forIcon('Tracks', Icons.playlist_play, albumSize),
      //Здесь должны появляться новые альбомы index=3
    ],
  ),
];

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () => buttonAlbum.openCreateAlbum(context),
              icon: Icon(Icons.playlist_add),
              iconSize: actionsButton,
            )
          ],
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Music', style: titleStyle),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  //Заголовок "Added albums"
                  Container(
                    color: Colors.white,
                    height: 72,
                    width: 1000,
                    alignment: Alignment.center,
                    child: Text('Added albums', style: containerText),
                  ),
                  //Список альбомов
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: albumList,
                    ),
                  ),
                  //Заголовок "My music"
                  Container(
                    color: Colors.white,
                    width: 1000,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'My music',
                      style: containerText,
                    ),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
        //Кнопки с музыкой
        SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ButtonTrack();
            },
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
}
