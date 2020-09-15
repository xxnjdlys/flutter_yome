import 'package:flutter/material.dart';
import 'package:flutter_yome/r.dart';
import 'package:flutter_yome/ui/chat/chat_fragment.dart';
import 'package:flutter_yome/ui/home/home_fragment.dart';
import 'package:flutter_yome/ui/my/my_fragment.dart';
import 'package:flutter_yome/generated/l10n.dart';

import 'bottom_navigation_item_view.dart';

class Tabs extends StatefulWidget {
  final index;

  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  String title = "";
  int _currentIndex = 0;
  final BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  _TabsState(index) {
    this._currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: Image.asset(
          R.assetsImgIcTalkNormal,
          width: 24.0,
          height: 24.0,
        ),
        activeIcon: Image.asset(
          R.assetsImgIcTalkSelected,
          width: 24.0,
          height: 24.0,
        ),
        // title: '发现',
        title: S.of(context).txt_tab_home,
        vsync: this,
      ),
      new NavigationIconView(
        icon: Image.asset(
          R.assetsImgIcChatNormal,
          width: 24.0,
          height: 24.0,
        ),
        activeIcon: Image.asset(
          R.assetsImgIcChatSelected,
          width: 24.0,
          height: 24.0,
        ),
        // title: '消息',
        title: S.of(context).txt_tab_chat,
        vsync: this,
      ),
      new NavigationIconView(
        icon: Image.asset(
          R.assetsImgIcMyNormal,
          width: 24.0,
          height: 24.0,
        ),
        activeIcon: Image.asset(
          R.assetsImgIcMySelected,
          width: 24.0,
          height: 24.0,
        ),
        // title: '我的',
        title: S.of(context).txt_tab_my,
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _navigationViews[_currentIndex].controller.value = 1.0;

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      backgroundColor: Color(0x00000000),
      elevation: 0.0,
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      // 文字选中原色
      fixedColor: Color(0XFFA833FA),
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("${_getCurrentTitle(_currentIndex)}"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: new IconButton(
              icon: Image.asset(
                R.assetsImgIconLikeBadge1,
                width: 24.0,
                height: 24.0,
              ),
              tooltip: 'new messages',
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: _getCurrentFragment(_currentIndex),

      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.mail),
      //   onPressed: null,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(2000.0)),
      //   ),
      // ),

      bottomNavigationBar: BottomAppBar(
        // color: Color(0XFFA833FA),
        shape: CircularNotchedRectangle(),
        child: botNavBar,
      ),
    );
  }

  static const int TAB_HOME = 0;
  static const int TAB_MESSAGE = 1;
  static const int TAB_MY = 2;

  String _getCurrentTitle(int position) {
    String t = "";
    switch (position) {
      case TAB_HOME:
        // t = "YoMe";
        t = S.of(context).txt_tab_home;
        break;
      case TAB_MESSAGE:
        // t = "消息";
        t = S.of(context).txt_tab_chat;
        break;
      case TAB_MY:
        // t = "个人资料";
        t = S.of(context).txt_tab_my;
        break;
    }
    return t;
  }

  Widget _getCurrentFragment(int position) {
    Widget widget;
    switch (position) {
      case TAB_HOME:
        widget = HomeFragment();
        setState(() {
          // title = "Home";
          title = S.of(context).txt_tab_home;
        });
        break;
      case TAB_MESSAGE:
        widget = ChatFragment();
        setState(() {
          // title = "Chat";
          title = S.of(context).txt_tab_chat;
        });
        break;
      case TAB_MY:
        widget = MyFragment();
        setState(() {
          // title = "My";
          title = S.of(context).txt_tab_my;
        });
        break;
    }
    return widget;
  }

  // Widget buildTabHolderFragment() => MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: new Scaffold(
  //       body: Center(
  //         // Center is a layout widget. It takes a single child and positions it
  //         // in the middle of the parent.
  //         child: Text(
  //           'Hello World $_currentIndex !!!',
  //         ),
  //       ),
  //     ));
  //
  void _rebuild() {}
}
