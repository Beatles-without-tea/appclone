import 'package:flutter/material.dart';

class tabs extends StatefulWidget {
  @override
  _tabsState createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Color _labelColor(int _selectedIndex){
    if (_selectedIndex==0)  {return Colors.blue;
    } else
      if (_selectedIndex==1){return Colors.red;
      }else
        if(_selectedIndex==2){return Colors.blue;
        }else
          if (_selectedIndex==3){return Colors.purple;
          }else
            if (_selectedIndex==4){return Colors.blue;}

  }
  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('texttt'),
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                primaryColor: _labelColor(_selectedIndex),
                splashColor: Colors.transparent,
                //highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    label: 'UK Home',

                    activeIcon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.business,
                      color: Colors.grey,
                    ),
                    label: 'UK Showbiz',
                    activeIcon: Icon(
                      Icons.business,
                      color: Colors.red,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.school,
                      color: Colors.grey,
                    ),
                    label: 'Just Pics',
                    activeIcon: Icon(
                      Icons.school,
                      color: Colors.blue,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.school,
                      color: Colors.grey,
                    ),
                    label: 'Femail',
                    activeIcon: Icon(
                      Icons.school,
                      color: Colors.purple,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    label: 'More',
                    activeIcon: Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedFontSize: 12,
                unselectedFontSize: 12,
              ),
            )));
  }
}
