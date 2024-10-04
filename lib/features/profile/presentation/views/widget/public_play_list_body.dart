
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'publich_play_list_item.dart';

class PublicPlayListBody extends StatelessWidget {
  const PublicPlayListBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit,SongsState>(
      builder: (context , state) {
        if(state is SongsPlayListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is SongsPlayListSuccess) {

          if(state.favSongs.length == 0) {
          // log(state.favSongs.length.toString());
            return Center(child: Opacity(
              opacity: .6,
              child: Container(
                height: 300,
                width: 500,
                
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.noItem))
                ),
              ),
            ),);
          }
          else
          return PublicPlayListItem(songs :state.favSongs);
        }
        else{
          // log("Loaded Failed public play list");
          return const Text("Wrong");
        }
      }
      
      );
  }
}