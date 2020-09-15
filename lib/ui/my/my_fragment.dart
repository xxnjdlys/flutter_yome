import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFragment extends StatefulWidget {
  @override
  _MyFragmentState createState() => _MyFragmentState();
}

/// Chat Fragment
class _MyFragmentState extends State<MyFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Text(
          "This is My Tab",
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
