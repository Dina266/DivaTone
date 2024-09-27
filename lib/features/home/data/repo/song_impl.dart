import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:diva_tone/features/home/data/models/song.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSong();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSong() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var song in data.docs) {
        var songModel = SongModel.fromJson(song.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return Left('An error occurred, try again later');
    }
  }
}
