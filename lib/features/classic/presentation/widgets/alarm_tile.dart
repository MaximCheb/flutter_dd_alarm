import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlarmExpandedTile extends StatefulWidget {
  const AlarmExpandedTile({Key? key}) : super(key: key);

  @override
  State<AlarmExpandedTile> createState() => _AlarmExpandedTileState();
}

class _AlarmExpandedTileState extends State<AlarmExpandedTile> {
  late bool isShort;
  @override
  void initState() {
    isShort = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isShort?shortWidget():extendedWidget()
    );
  }
  Widget shortWidget(){
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          Column(
            children: [
              Text("Name"),
              Text("06:30"),
              Text("monday")
            ],
          ),          
          SizedBox(width: 64),
          Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_down)),
              SizedBox(height: 64,),
              //Switch(value: true, onChanged: (){}),
            ],
          ),
        ],
      ),
    );
  }
  Widget extendedWidget(){
    return SizedBox(
      height: 144,
    );
  }
}