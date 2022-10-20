import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';

class AlarmExpandedTile extends StatefulWidget {
  final AlarmEntity entity;
  const AlarmExpandedTile({Key? key, required this.entity}) : super(key: key);

  @override
  State<AlarmExpandedTile> createState() => _AlarmExpandedTileState(entity);
}

class _AlarmExpandedTileState extends State<AlarmExpandedTile> {
  final AlarmEntity alarmEntity;
  late bool isShort;

  _AlarmExpandedTileState(this.alarmEntity);
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
              Text("alarmEntity.name"),
              Text("alarmEntity.time"),
              Text("alarmEntity.days.toString()")
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