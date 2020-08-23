import 'package:flutter/material.dart';
import 'package:app/pages/NewsPage.dart';
import 'package:app/pages/MusicPage.dart';
import 'package:app/pages/ProfilePage.dart';
import 'package:app/pages/SettingsPage.dart';

void main() {
  runApp(MyApp());
}

//Приложение
class MyApp extends StatelessWidget {
  final String title = 'Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Cookie',
            bodyColor: Colors.black,
            displayColor: Colors.black),
        primaryColor: Colors.white,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Cookie',
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      home: MyStatefulWidget(),
    );
  }
}

//Виджет, который будет менять свое состояние
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

//Состояние виджета
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedIndex = 0;
  //Список виджетов, которые будут отображаться на экране
  static List<Widget> widgetOptions = <Widget>[
    NewsPage(),
    MusicPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //контент
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      //нижние кнопки
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/wallpost.png'),
            ),
            title: Text('Wallpost'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/music.png'),
            ),
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/profile.png'),
            ),
            title: Text('Account'),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
