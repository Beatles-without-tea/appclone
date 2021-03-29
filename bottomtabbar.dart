import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mailclone/ukhomeapi.dart';
import 'package:mailclone/UKshowbizapi.dart';
import 'package:mailclone/justpicsapi.dart';
import 'package:mailclone/femailapi.dart';

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
    if (_selectedIndex==0)  {return Color(0xFF3A5A98);
    } else
    if (_selectedIndex==1){return Color(0xFFD32F2F);
    }else
    if(_selectedIndex==2){return Color(0xFF3A5A98);
    }else
    if (_selectedIndex==3){return Colors.purple;
    }else
    if (_selectedIndex==4){return Color(0xFF3A5A98);
    }else {return Color(0xFF3A5A98);}

  }

  String _titleTabBar(int _selectedIndex){
    if (_selectedIndex==0)  {return "UK Home";
    } else
    if (_selectedIndex==1){return "UK Showbiz";
    }else
    if(_selectedIndex==2){return "Just The Pictures";
    }else
    if (_selectedIndex==3){return "Femail";
    }else
    if (_selectedIndex==4){return "More";
    }else {return "word";}

  }

  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(

            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            centerTitle: true,
            backgroundColor:_labelColor( _selectedIndex),
            title:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/m2_icon.png',
                  fit: BoxFit.contain,
                  height: 32,
                  color:Colors.white,
                ),
                Text(_titleTabBar(_selectedIndex),style:TextStyle(fontWeight: FontWeight.normal )),


              ],

            ),
          ),


          body: _selectedIndex==0? mainBody(): _selectedIndex==1? showBiz(): _selectedIndex==2? justPics(): femailAPI(),




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
                  icon: ImageIcon(AssetImage('assets/images/m2_icon.png')
                      ,color: Colors.grey,size:25),
                  label: 'UK Home',

                  activeIcon: ImageIcon(AssetImage('assets/images/m2_icon.png')
                      ,color: Color(0xFF3A5A98),size:25),

                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_rate,
                    color: Colors.grey,
                  ),
                  label: 'UK Showbiz',
                  activeIcon: Icon(
                    Icons.star_rate,
                    color: Color(0xFFD32F2F),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                  label: 'Just Pics',
                  activeIcon: Icon(
                    Icons.camera_alt,
                    color: Color(0xFF3A5A98),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/heel2.png')
                    ,color: Colors.grey,size:25,),
                  label: 'Femail',
                  activeIcon:ImageIcon(AssetImage('assets/images/heel2.png')
                    ,color: Colors.purple,size:25,),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                  label: 'More',
                  activeIcon: Icon(
                    Icons.more_horiz,
                    color: Color(0xFF3A5A98),
                  ),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedFontSize: 12,
              unselectedFontSize: 12,
            ),
          )

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}