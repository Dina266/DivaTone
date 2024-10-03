
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/constatnts/app_url.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../song_player/presentation/views/song_player_view.dart';
import '../../../domain/entities/song.dart';

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
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> 
                  SongPlayerView(songs : songs[index]))),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode?  AppColors.darkGrey : const Color(0xffE6E6E6),
                        ),
                        child: Icon(Icons.play_arrow_rounded,
                        color: context.isDarkMode? const Color(0xff959595) : const Color(0xff555555),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
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
        return const SizedBox(width: 14,);
      },  
      itemCount: songs.length
      );
  }
}