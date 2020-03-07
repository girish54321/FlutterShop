import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final String text;

  const HomeBody({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
