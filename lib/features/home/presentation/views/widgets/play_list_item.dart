
import 'package:flutter/material.dart';

import '../../../domain/entities/song.dart';
import 'custom_play_list_item.dart';

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