import 'package:flutter/material.dart';
import 'package:app/pages/NewsPage.dart';
import 'package:app/pages/MusicPage.dart';
import 'package:app/pages/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

//Приложение
class MyApp extends StatelessWidget {
  final String title = 'App';
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
      home: MyStatefulWidget(),
    );
  }
}

//Виджет
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

//Состояние виджета
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  //Список виджетов, которые будут отображаться на экране
  static List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    MusicPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //контент
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      //нижние кнопки
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
