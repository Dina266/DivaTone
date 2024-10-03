import 'dart:developer';

import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/core/components/widgets/favorite_button.dart';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:diva_tone/features/song_player/presentation/view_model/cubit/song_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/constatnts/app_url.dart';
import '../../../../core/utils/app_colors.dart';

class SongPlayerView extends StatelessWidget {
  const SongPlayerView({super.key, required this.songs});
  final SongEntity songs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              title: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Icon(Icons.more_vert,
                    color: context.isDarkMode ? Colors.white : Colors.black)
              ],
            ),
            body: BlocProvider(
              create: (context) => SongPlayerCubit()
                ..loadSong(
                    url:
                        '${AppUrls.songsfireStorage}${songs.artist}, ${songs.title}.mp3${AppUrls.mediaAlt}'),
              child: SongPlayerViewBody(
                songs: songs,
              ),
            )));
  }
}

class SongPlayerViewBody extends StatelessWidget {
  const SongPlayerViewBody({super.key, required this.songs});
  final SongEntity songs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
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
          SongPlayer()
        ],
      ),
    );
  }
}

class SongPlayer extends StatelessWidget {
  const SongPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SongPlayerSuccess) {
        return Column(
          children: [
            Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {}),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songPosition)),
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songDuration)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                context.read<SongPlayerCubit>().playOrPauseSong();

              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary
                ),
                child: Icon(
                  context.read<SongPlayerCubit>().audioPlayer.playing? Icons.pause: Icons.play_arrow
                ),
              ),
            )
          ],
        );
      } else {
        return const Center(
          child: Text('SomeThing Error'),
        );
      }
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    log(duration.toString());
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
