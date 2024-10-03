
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/favorite_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../song_player/presentation/views/song_player_view.dart';
import '../../../domain/entities/song.dart';

class CustomPlayListItem extends StatelessWidget {
  const CustomPlayListItem({super.key, required this.songs});
  final List<SongEntity> songs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SongPlayerView(songs : songs[index]))),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6),
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                ),
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
            Text(songs[index].duration.toString().replaceAll('.', ':') , style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),),
            const SizedBox(width: 24,),
            FavoriteButton(songEntity: songs[index],)
          ],
        ),
      ),
    );
  }
}
