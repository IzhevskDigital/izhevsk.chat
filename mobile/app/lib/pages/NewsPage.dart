import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpost',
            style: TextStyle(fontSize: 50, fontFamily: 'Cookie')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            tooltip: 'Жанры музыки',
            onPressed: () => openStylePage(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Image.network(
                      'http://eaassets-a.akamaihd.net/battlelog/prod/emblem/342/900/320/2955061318516661358.png?v=1530900955',
                      height: 100,
                      width: 100),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Center(child: Text('Story')),
              ),
            ),
          ],
        ),
      ),
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

  void openAlbum(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Dust'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text('Image'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('1'),
                                Text('Dust'),
                                Text('2:45'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
