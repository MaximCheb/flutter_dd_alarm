import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title_app, style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return const Dialog(
                
              );
            });
          }, 
          icon: Icon(Icons.menu),color: Colors.white24,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: AppLocalizations.of(context)!.tab_alarms,
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: AppLocalizations.of(context)!.tab_calendar,
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: AppLocalizations.of(context)!.tab_geo,
            backgroundColor: Colors.greenAccent[400],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addAlarm( _selectedIndex);
        },
        backgroundColor: Colors.indigo,
        hoverColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addAlarm(int index){
    switch (index) {
      case 0:
        if (kDebugMode) {
          print(0);
        }
        break;
      case 1:
        if (kDebugMode) {
          print(1);
        }
        break;
      case 2:
        if (kDebugMode) {
          print(2);
        }
        break;
      default:
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
