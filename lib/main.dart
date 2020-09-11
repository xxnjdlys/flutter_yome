import 'package:flutter/material.dart';
import 'package:flutter_yome/r.dart';
import 'package:flutter_yome/widget/bottom_navigation_item_view.dart';

void main() {
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  static const MaterialColor themeColor = MaterialColor(
    0XFFA833FA,
    <int, Color>{
      50: Color(0XFFA833FA),
      100: Color(0XFFA833FA),
      200: Color(0XFFA833FA),
      300: Color(0XFFA833FA),
      400: Color(0XFFA833FA),
      500: Color(0XFFA833FA),
      600: Color(0XFFA833FA),
      700: Color(0XFFA833FA),
      800: Color(0XFFA833FA),
      900: Color(0XFFA833FA),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String title = "";

  // _MyHomePageState({this.title}) : super();

  int _currentIndex = 0;
  final BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();

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
        title: '发现',
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
        title: '消息',
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
        title: '我的',
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
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
        title: Text(_getCurrentTitle(_currentIndex)),
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
      bottomNavigationBar: botNavBar,
    );
  }

  static const int TAB_HOME = 0;
  static const int TAB_MESSAGE = 1;
  static const int TAB_MY = 2;

  String _getCurrentTitle(int position) {
    String t = "";
    switch (position) {
      case TAB_HOME:
        t = "Home";
        break;
      case TAB_MESSAGE:
        t = "Chat";
        break;
      case TAB_MY:
        t = "My";
        break;
    }
    return t;
  }

  Widget _getCurrentFragment(int position) {
    Widget widget;
    switch (position) {
      case TAB_HOME:
        widget = buildTabHolderFragment();
        setState(() {
          title = "Home";
        });
        break;
      case TAB_MESSAGE:
        widget = buildTabHolderFragment();
        setState(() {
          title = "Chat";
        });
        break;
      case TAB_MY:
        widget = buildTabHolderFragment();
        setState(() {
          title = "My";
        });
        break;
    }
    return widget;
  }

  Widget buildTabHolderFragment() => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Text(
            'Hello World!',
          ),
        ),
      ));
}
