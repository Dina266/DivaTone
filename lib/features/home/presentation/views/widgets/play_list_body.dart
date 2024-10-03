
import 'dart:developer';

import 'package:diva_tone/features/home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'play_list_item.dart';

class PlayListBody extends StatelessWidget {
  const PlayListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit,SongsState>(
      builder: (context , state) {
        if(state is SongsPlayListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is SongsPlayListSuccess) {
          return PlayListItem(songs :state.songs);

        }
        else{
          log("Loaded Failed");
          return const Text("Wrong");
        }
      }
      
      );
  }
}