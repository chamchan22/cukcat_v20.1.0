import 'package:flutter/material.dart';

BottomNavigationBar BottomNavBarWidget({
  @required int selectedIndex,
  @required void onItemTappedFunc,
  @required List<BottomNavigationBarItem> itemList,
}){
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.indigo,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: null,
        icon: Icon(Icons.home),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        activeIcon: null,
        icon: Icon(Icons.category),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        activeIcon: null,
        icon: Icon(Icons.supervised_user_circle),
        title: Text(''),
      ),
    ],
    currentIndex: selectedIndex,
//    onTap: (index) => onItemTappedFunc(index),
  );
}