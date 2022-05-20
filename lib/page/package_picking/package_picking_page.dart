import 'package:flutter/material.dart';

class PackPickPage extends StatefulWidget {
  const PackPickPage({Key key}) : super(key: key);
  static const routeName = '/PackPickPage';

  @override
  State<PackPickPage> createState() => _PackPickPageState();
}

class _PackPickPageState extends State<PackPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
