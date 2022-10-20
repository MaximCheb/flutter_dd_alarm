
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';
import 'package:flutter_geo_alarm/features/classic/presentation/bloc/alarm_cubit.dart';
import 'package:flutter_geo_alarm/features/classic/presentation/bloc/alarm_state.dart';

import 'alarm_tile.dart';

class AlarmsList extends StatelessWidget {
  AlarmsList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AlarmCubit>(context);
    return BlocBuilder<AlarmCubit,AlarmState>(
      buildWhen: (context,state){
        return state is LoadedAlarmsState;
      },
      builder: ((context, state) {
        List<AlarmEntity> alarms = List.empty();
        if (state is LoadingAlarmsState){
          return _loadingIndicator();
        }
        else if(state is LoadedAlarmsState){
          alarms = state.alarms;
          return ListView.separated(
              itemBuilder: (context,index){
                if (index<alarms.length){
                  return AlarmExpandedTile (entity: alarms[index]);
                } else {if ( state is LoadingAlarmsState) {
                  return _loadingIndicator();
                }
                return _loadingIndicator();
                }
              },
              separatorBuilder: (context, index){
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: alarms.length
          );
        }else if(state is ErrorState){
            return Text(state.message, style: const TextStyle(color: Colors.blueGrey, fontSize: 20),);
        }
        return _loadingIndicator();
    }
      ),

    );
  }

  Widget _loadingIndicator() {
    return Padding(padding: const EdgeInsets.all(8.0),
    child: Center(child: CircularProgressIndicator()),
    );
  }
}