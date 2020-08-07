import 'package:flutter/material.dart';

ThemeMode themeMode = ThemeMode.light;
bool _isSwitched = false;

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text('Изменить тему', style: TextStyle(fontSize: 20)),
                Switch(
                  value: _isSwitched,
                  onChanged: (_isSwitched) => switchPageStyle(_isSwitched),
                ),
              ],
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ]),
      ),
    );
  }

  void switchPageStyle(bool isSwitch) {
    setState(() {
      _isSwitched = isSwitch;
      if (_isSwitched == true) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    });
  }
}
