import 'package:flutter/material.dart';

String nameAlbum = 'Dust';
String nameSong = 'Dust';
String autor = 'NoName';
String timer = '2:45';

void openAlbum(BuildContext context) {
  TextStyle textStyle = TextStyle(fontSize: 40);
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(nameAlbum,
                  style: TextStyle(fontFamily: 'Cookie', fontSize: 50)),
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
    },
  ));
}
