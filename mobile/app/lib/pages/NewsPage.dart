import 'package:app/pages/album.dart';
import 'package:flutter/material.dart';
//import 'package:app/pages/album.dart';

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
            title: Text('Wallpost',
                style: TextStyle(fontFamily: 'Cookie', fontSize: 50)),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 366,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.network(
                            'https://avatanplus.com/files/resources/original/575af465131c91553b4aaad6.jpg'),
                        onPressed: () => openAlbum(context),
                        iconSize: 150,
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        child: Center(
                          child: Text(
                              'Группа "Plono" представила свой новый альбом, отображающий жизнь в современной России, назвав его "Пыль".',
                              textAlign: TextAlign.justify),
                        ),
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
