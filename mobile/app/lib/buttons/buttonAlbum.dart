import 'package:app/Theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/buttons/buttonTrack.dart';
import 'package:app/pages/MusicPage.dart';

// ignore: must_be_immutable
class ButtonAlbum extends StatelessWidget {
  MusicPage parent;
  String name;
  String image;
  double iconSize;
  IconData icon;
  ButtonAlbum();
  ButtonAlbum.parent(this.parent);
  ButtonAlbum.forImage(this.name, this.image, this.iconSize);
  ButtonAlbum.forIcon(this.name, this.icon, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => checkFunction(context),
                icon: getPicture(),
                iconSize: iconSize,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '$name',
                style: titleAlbum,
              ),
            ],
          ),
        ],
      ),
    );
  }

  checkFunction(BuildContext context) {
    if (icon == Icons.playlist_add) {
      return openCreateAlbum(context);
    } else {
      return openAlbum(context);
    }
  }

  getPicture() {
    if (image != null) {
      return Image.network(image);
    } else {
      return Icon(icon);
    }
  }

  //Окно существующего альбома
  void openAlbum(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[
            //Верхняя часть окна
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(name, style: titleAlbum),
              ),
            ),
            //Музыкальные треки
            SliverFixedExtentList(
              itemExtent: albumSize,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ButtonTrack();
                },
              ),
            ),
          ],
        );
      },
    ));
  }

//Окно, в котором пользователь сможет создать новый альбом
  void openCreateAlbum(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        TextEditingController _controller = TextEditingController();

        return Scaffold(
          appBar: AppBar(
            title: Text('Создать новый альбом'),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    onChanged: (name) {
                      RaisedButton(onPressed: setName(name));
                    },
                    onSubmitted: (name) {
                      createAlbum(name);
                      Navigator.pop(context);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Название альбома',
                    ),
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      createAlbum(name);
                      Navigator.pop(context);
                    },
                    child: Text('Создать'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  setName(String name) {
    this.name = name;
  }

  createAlbum(String name) {
    albumList.add(ButtonAlbum.forIcon('$name', Icons.list, albumSize));
    this.name = name;
    return albumList;
  }
}
