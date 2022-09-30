import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlarmsPage extends StatefulWidget {
  const AlarmsPage({Key? key}) : super(key: key);

  @override
  State<AlarmsPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmsPage>
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
        title: Text(AppLocalizations.of(context)!.title_app, style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return const Dialog(
                
              );
            });
          }, 
          icon: Icon(Icons.menu),color: Theme.of(context).colorScheme.onBackground,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: AppLocalizations.of(context)!.tab_alarms,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: AppLocalizations.of(context)!.tab_calendar,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: AppLocalizations.of(context)!.tab_geo,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          
          onPressed: () {
            _addAlarm( _selectedIndex);
          },
          backgroundColor: Theme.of(context).primaryColor,
          hoverColor: Theme.of(context).hoverColor,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.onBackground,size: 32,),
        ),
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
