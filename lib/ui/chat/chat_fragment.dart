import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatFragment extends StatefulWidget {
  @override
  _ChatFragmentState createState() => _ChatFragmentState();
}

/// Chat Fragment
class _ChatFragmentState extends State<ChatFragment>
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
          "This is Chat Tab",
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
