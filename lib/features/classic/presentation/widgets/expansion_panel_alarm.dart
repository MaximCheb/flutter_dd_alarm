import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget tallTile(){
    return Container(
      padding: EdgeInsets.all(4.0),
    );
  }
  Widget shortTile(){
    return Container(
      padding: EdgeInsets.all(4.0),
    );
  }
}