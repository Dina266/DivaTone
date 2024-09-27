import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../data/models/song.dart';
import '../../../domain/entities/song.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListInitial());
  Future getPlayList () async {
    emit(PlayListLoading());
try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(4)
          .get();


      for (var song in data.docs) {
        var songModel = SongModel.fromJson(song.data());
        songs.add(songModel.toEntity());
      }
      emit(PlayListSuccess(playList: songs));

      return Right(songs);
    } catch (e) {
      emit(PlayListFailure());
      return Left('An error occurred, try again later');
    }
  }
}



