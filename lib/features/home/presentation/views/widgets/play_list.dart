import 'dart:developer';

import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/features/home/presentation/view_model/cubit_play_list/play_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entities/song.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> PlayListCubit()..getPlayList(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PlayListBody(),
      ),
      );
  }
}

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
          return Text("Wrong");
        }
      }
      
      );
  }
}
class PlayListItem extends StatelessWidget {
  const PlayListItem({super.key, required this.songs});
  final List<SongEntity> songs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PlayList",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "see more",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: CustomPlayListItem(songs: songs),
        ),
      ],
    );
  }
}

class CustomPlayListItem extends StatelessWidget {
  const CustomPlayListItem({super.key, required this.songs});
  final List<SongEntity> songs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.isDarkMode ? Color(0xff959595) : AppColors.darkGrey,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkMode ? AppColors.darkGrey : Color(0xff959595),
              ),
            ),
            const SizedBox(width: 20), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songs[index].title == 'ya_nas_kwlwly'
                        ? 'Ya Nas Kwlwly'
                        : songs[index].title == 'Sheel_Oyunak_Any'
                            ? 'Sheel Oyunak Any'
                            : songs[index].title == 'mn_mslsl_alatawlah'
                                ? 'AlAtawla'
                                : 'Yama Lyaly',
                    style: TextStyle(
                      color: context.isDarkMode? Colors.white: Colors.black,
                      fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    songs[index].artist == 'nancy_agram'
                        ? 'Nancy Agram'
                        : songs[index].artist == 'sara_hytham'
                            ? 'Sara Haytham'
                            : 'Hasan Shakosh',
                    style: TextStyle(
                      color: context.isDarkMode? Colors.grey: AppColors.darkGrey,
                      fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  
                ],
              ),

            ),
            Text('${songs[index].duration.toString().replaceAll('.', ':')}' , style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),),
            SizedBox(width: 24,),
            Icon(Icons.favorite , color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
