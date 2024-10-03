import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:diva_tone/features/song_player/presentation/view_model/cubit/song_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/constatnts/app_url.dart';
import 'widgets/song_player_view_body.dart';

class SongPlayerView extends StatelessWidget {
  const SongPlayerView({super.key, required this.songs});
  final SongEntity songs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              isHome: true,
              title: const Text(
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

