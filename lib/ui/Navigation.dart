import 'package:flutter/material.dart';
import 'file:///C:/Users/Felix%20Fedalies/AndroidStudioProjects/sample_app/lib/ui/photos.dart';
import 'file:///C:/Users/Felix%20Fedalies/AndroidStudioProjects/sample_app/lib/ui/googleNews.dart';
import 'file:///C:/Users/Felix%20Fedalies/AndroidStudioProjects/sample_app/lib/ui/games.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  MyNavigationState createState() => MyNavigationState();
}
  class MyNavigationState extends State<MyNavigationBar>{
  int _currentIndex = 0;
  final List<Widget> pages = [GoogleNews(),Photopage(),Games()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/news_icon.png'),
              ),
              title: Text('Google News'),
              backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text('Photos'),
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            title: Text('Games'),
            backgroundColor: Colors.red
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex= index;
          });
        },
      ),
    );
    throw UnimplementedError();
  }
  }

