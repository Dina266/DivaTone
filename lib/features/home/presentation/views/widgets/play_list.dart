import 'package:diva_tone/features/home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'play_list_body.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> SongsCubit()..getPlayList(),
      child:const  Padding(
        padding: EdgeInsets.all(20.0),
        child: PlayListBody(),
      ),
      );
  }
}

