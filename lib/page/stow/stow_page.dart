import 'package:flutter/material.dart';

class StowPage extends StatefulWidget {
  const StowPage({Key key}) : super(key: key);
  static const routeName = '/StowPage';

  @override
  State<StowPage> createState() => _StowPageState();
}

class _StowPageState extends State<StowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
