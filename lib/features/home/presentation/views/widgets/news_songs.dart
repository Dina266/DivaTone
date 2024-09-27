import 'dart:developer';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/core/utils/app_colors.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:diva_tone/features/home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/constatnts/app_url.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> SongsCubit()..getNewsSong(),
      child: NewsSongsBody(),
      );
  }

  
}

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
          return Text("Wrong");
        }
      }
      
      );
  }


}


class SongsList extends StatelessWidget {
  const SongsList({super.key, required  this.songs});
final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:const EdgeInsets.only(right: 10, left: 10),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context , index) {
        return SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${AppUrls.fireStorage}${songs[index].artist}, ${songs[index].title}.jpeg${AppUrls.mediaAlt}'
                    ))
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 40,
                      height: 40,
                      transform: Matrix4.translationValues(10,10,0),
                      child: Icon(Icons.play_arrow_rounded,
                      color: context.isDarkMode? Color(0xff959595) : AppColors.darkGrey,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode?  AppColors.darkGrey : Color(0xff959595),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                songs[index].title == 'ya_nas_kwlwly'?'Ya Nas Kwlwly' :
                songs[index].title == 'Sheel_Oyunak_Any'?'Sheel Oyunak Any':
                songs[index].title == 'mn_mslsl_alatawlah'? 'AlAtawla' : 'Yama Lyaly',
                style: TextStyle(
                      color: context.isDarkMode? Colors.white: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
              Text(
                songs[index].artist == 'nancy_agram'?'Nancy Agram' :
                songs[index].artist == 'sara_hytham'?'Sara Haytham': 'Hasan Shakosh',
                style: TextStyle(
                      color: context.isDarkMode? Colors.grey: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12
                ),
              ),
          
            ],
          ),
        );
      }, 
      separatorBuilder: (context , index) {
        return SizedBox(width: 14,);
      },  
      itemCount: songs.length
      );
  }
}