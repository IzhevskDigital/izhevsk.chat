import 'package:flutter/material.dart';
import 'package:app/pages/SettingsPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account',
            style: TextStyle(fontSize: 50, fontFamily: 'Cookie')),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Настройки',
            onPressed: () => openSettingsPage(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    height: 200,
                    child: Center(
                      child: Image.network(
                          'http://eaassets-a.akamaihd.net/battlelog/prod/emblem/342/900/320/2955061318516661358.png?v=1530900955',
                          scale: 2),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    height: 200,
                    alignment: Alignment.center,
                    child: Center(
                      child: ListView(
                        children: <Widget>[
                          Text('NickName', style: TextStyle(fontSize: 55)),
                          Text('Подписка оформлена',
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                    child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Подписка', style: TextStyle(fontSize: 15)),
                      color: Colors.green,
                      onPressed: () => null,
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openSettingsPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return SettingsPage();
      },
    ));
  }
}
