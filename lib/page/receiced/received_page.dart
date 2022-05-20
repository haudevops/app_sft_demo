import 'package:flutter/material.dart';

class ReceivedPage extends StatefulWidget {
  const ReceivedPage({Key key}) : super(key: key);
  static const routeName = '/ReceivedPage';

  @override
  State<ReceivedPage> createState() => _ReceivedPageState();
}

class _ReceivedPageState extends State<ReceivedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
