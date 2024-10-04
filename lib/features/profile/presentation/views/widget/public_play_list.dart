
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'public_play_list_body.dart';

class PublicPlayList extends StatelessWidget {
  const PublicPlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> SongsCubit()..getPlayList(),
      child:const  Padding(
        padding: EdgeInsets.all(20.0),
        child: PublicPlayListBody(),
      ),
      );
  }
}
