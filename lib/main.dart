import 'package:flutter/material.dart';
import 'package:flutter_yome/r.dart';
import 'package:flutter_yome/generated/l10n.dart';
import 'package:flutter_yome/widget/bottom_navigation_item_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        ...S.delegate.supportedLocales
      ],
      theme: ThemeData(
        primarySwatch: themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String title = "";
  int _currentIndex = 0;
  final BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
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

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

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
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
        widget = buildTabHolderFragment();
        setState(() {
          // title = "Home";
          title = S.of(context).txt_tab_home;
        });
        break;
      case TAB_MESSAGE:
        widget = buildTabHolderFragment();
        setState(() {
          // title = "Chat";
          title = S.of(context).txt_tab_chat;
        });
        break;
      case TAB_MY:
        widget = buildTabHolderFragment();
        setState(() {
          // title = "My";
          title = S.of(context).txt_tab_my;
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
            'Hello World $_currentIndex !!!',
          ),
        ),
      ));
}
