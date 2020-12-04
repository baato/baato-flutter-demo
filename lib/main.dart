import 'package:flutter/material.dart';
import 'package:flutter_app/models/home_menu.dart';
import 'package:flutter_app/ui/baato_reverse.dart';
import 'package:flutter_app/ui/baato_search.dart';
import 'package:flutter_app/ui/breeze_map.dart';
import 'package:flutter_app/ui/monochrome_map.dart';
import 'package:flutter_app/ui/retro_map.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<HomeMenu> homeMenus = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeMenus.add(new HomeMenu(title: "Search", subTitle: "Example for Baato Search API"));
    homeMenus.add(new HomeMenu(title: "Reverse", subTitle: "Example for Baato Reverse Search API"));
    homeMenus.add(new HomeMenu(title: "Breeze Map", subTitle: "Example for Baato Breeze map style"));
    homeMenus.add(new HomeMenu(title: "Monochrome Map", subTitle: "Example for Baato Monochrome map style"));
    homeMenus.add(new HomeMenu(title: "Retro Map", subTitle: "Example for Baato Retro map style API"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Baato Flutter"),
        backgroundColor: Color.fromRGBO(8, 30, 42, 50),
      ),
      body: new StringList(homeMenus: homeMenus),
    );
  }
}

class StringList extends StatelessWidget {
  final List<HomeMenu> homeMenus;

  StringList({@required this.homeMenus});

  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemCount: homeMenus.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.deepOrange,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${homeMenus[index].title}'),
          subtitle: Text('${homeMenus[index].subTitle}'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaatoSearchExample()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaatoReverseExample()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BreezeMapStyle()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonochromeMapStyle()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RetroMapStyle()),
                );
                break;
            }
            print('tapped' + homeMenus[index].title);
          },
        );
      },
    );
  }
}
