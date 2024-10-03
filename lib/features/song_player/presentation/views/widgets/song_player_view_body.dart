
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/constatnts/app_url.dart';
import '../../../../../core/components/widgets/favorite_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../home/domain/entities/song.dart';
import 'song_player.dart';

class SongPlayerViewBody extends StatelessWidget {
  const SongPlayerViewBody({super.key, required this.songs});
  final SongEntity songs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${AppUrls.fireStorage}${songs.artist}, ${songs.title}.jpeg${AppUrls.mediaAlt}'))),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      songs.title == 'ya_nas_kwlwly'
                          ? 'Ya Nas Kwlwly'
                          : songs.title == 'Sheel_Oyunak_Any'
                              ? 'Sheel Oyunak Any'
                              : songs.title == 'mn_mslsl_alatawlah'
                                  ? 'AlAtawla'
                                  : 'Yama Lyaly',
                      style: TextStyle(
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      songs.artist == 'nancy_agram'
                          ? 'Nancy Agram'
                          : songs.artist == 'sara_hytham'
                              ? 'Sara Haytham'
                              : 'Hasan Shakosh',
                      style: TextStyle(
                          color: context.isDarkMode
                              ? Colors.grey
                              : AppColors.darkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ],
                ),
                FavoriteButton(songEntity: songs)
              ],
            ),
          ),
          const SongPlayer()
        ],
      ),
    );
  }
}