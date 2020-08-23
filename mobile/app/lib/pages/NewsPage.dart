import 'package:app/Theme/constants.dart';
import 'package:app/buttons/buttonAlbum.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () => openStylePage(context),
            ),
          ],
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Wallpost', style: titleStyle),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 320,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 320,
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Column(children: <Widget>[
                          Center(
                            child: ButtonAlbum.forImage(
                                'Imagine Dragons',
                                'https://avatars.yandex.net/get-music-content/118603/36b7d6e2.a.4440406-1/m1000x1000?webp=false',
                                150),
                          ),
                          Text(
                              'Группа "Plono" представила свой новый альбом, отображающий жизнь в современной России, назвав его "Пыль".',
                              textAlign: TextAlign.justify,
                              style: textStyle),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
            },
            //childCount: 20,
          ),
        ),
      ],
    );
  }

  void openStylePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Жанры музыки'),
          ),
          body: Center(
            child: Text(
              'Здесь будет список с жанрами музыки.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}
