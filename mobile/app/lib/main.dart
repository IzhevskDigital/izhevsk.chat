import 'package:flutter/material.dart';

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
        primarySwatch: Colors.orange,
        secondaryHeaderColor: Colors.orange,
        //primaryColor: Colors.orange,
        brightness: Brightness.dark,
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            title: Text('Главная'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Музыка'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Профиль'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
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

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: 'Жанры музыки',
            onPressed: () => openStylePage(context),
          ),
        ],
      ),
      body: Center(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.amber,
                  child: const Center(
                    child: Text('Image'),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 200,
                    color: Colors.green,
                    child: const Center(child: Text('Story')),
                  )),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Music'),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void openStylePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Жанры музыки'),
          ),
          body: const Center(
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

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Музыка'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.playlist_add),
            tooltip: 'Добавить плейлист',
            onPressed: () => openPlaylistAdd(context),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(child: Text('Add Playlist')),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: const Center(
                child: Text('Playlists'),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text('Music'),
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  void openPlaylistAdd(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Новый плейлист'),
          ),
          body: const Center(
            child: Text(
              'Новый плейлист',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
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
                    height: 200,
                    color: Colors.amber,
                    child: const Center(
                      child: Text('Image'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 200,
                    color: Colors.red,
                    child: const Center(
                      child: Text('NickName'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(
                      'Почта',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Пароль',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Подписка',
                      style: TextStyle(fontSize: 24),
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
        return Scaffold(
          appBar: AppBar(
            title: const Text('Настройки'),
          ),
          body: const Center(
            child: Text(
              'Настройки',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}
