
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit_play_list/play_list_cubit.dart';
import 'play_list_item.dart';

class PlayListBody extends StatelessWidget {
  const PlayListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayListCubit,PlayListState>(
      builder: (context , state) {
        if(state is PlayListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is PlayListSuccess) {
          return PlayListItem(songs :state.playList);

        }
        else{
          log("Loaded Failed");
          return const Text("Wrong");
        }
      }
      
      );
  }
}