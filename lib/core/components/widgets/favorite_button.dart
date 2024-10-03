import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:diva_tone/features/home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/view_model/cubit/favorite_button_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.songEntity});
  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=> FavoriteButtonCubit()..favouriteButtonUpdated(songId: songEntity.songId),

    child: BlocBuilder<FavoriteButtonCubit,FavoriteButtonState>(
      builder: (context, state) {
        if (state is FavoriteButtonInitial) {
          return IconButton(
              onPressed: (){
                context.read<FavoriteButtonCubit>().favouriteButtonUpdated(
                  songId: songEntity.songId
                  );
              },
              icon: Icon(
                songEntity.isFavorite?
                Icons.favorite:
                Icons.favorite_border_rounded , 
                color: Colors.grey,size: 26,));
        }
        else if (state is FavoriteButtonUpdated) {
          return IconButton(
              onPressed: (){
                context.read<FavoriteButtonCubit>().favouriteButtonUpdated(
                  songId: songEntity.songId
                  );
              },
              icon: Icon(
                state.isFavorite?
                Icons.favorite:
                Icons.favorite_border_rounded , 
                color: Colors.grey,size: 26,));
        }
        else {
          return const SizedBox(
            child: Center(child: Text('Error Occurred'),),
          );
        }
      }
      ),
    );
  }
}