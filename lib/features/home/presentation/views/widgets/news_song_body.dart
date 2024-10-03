
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit_news_songs/songs_cubit.dart';
import 'songs_list.dart';

class NewsSongsBody extends StatelessWidget {
  const NewsSongsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit,SongsState>(
      builder: (context , state) {
        if(state is SongsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is SongsSuccess) {
          log('${state.songs.length}');
          return SongsList(songs :state.songs);

        }
        else{
          log("Loaded Failed");
          return const Text("Wrong");
        }
      }
      
      );
  }


}
