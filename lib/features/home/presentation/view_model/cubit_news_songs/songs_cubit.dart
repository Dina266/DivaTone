
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:meta/meta.dart';

import '../../../data/models/song.dart';

part 'songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(SongsInitial());
  Future getNewsSong () async {
    emit(SongsLoading());
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
      emit(SongsSuccess(songs: songs));

      return Right(songs);
    } catch (e) {
      emit(SongsFailure());
      return Left('An error occurred, try again later');
    }
  }

}
