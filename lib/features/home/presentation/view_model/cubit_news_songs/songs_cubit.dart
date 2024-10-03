// import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:diva_tone/features/home/domain/entities/song.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/song.dart';

part 'songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(SongsInitial());

  Future getNewsSong () async {
    emit(SongsNewsLoading());
try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var song in data.docs) {
        var songModel = SongModel.fromJson(song.data());
        // log("reference id : ${song.reference.id}");
        bool isFavorite = await isFavoriteSong(songId: song.reference.id);
        songModel.isFavorite = isFavorite;
        songModel.songId = song.reference.id;
        songs.add(songModel.toEntity());
      }
      emit(SongsNewsSuccess(songs: songs));

      return Right(songs);
    } catch (e) {
      emit(SongsFailure());
      return Left('An error occurred, try again later');
    }
  }


  Future getPlayList () async {
    emit(SongsNewsLoading());
try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(4)
          .get();


      for (var song in data.docs) {
        var songModel = SongModel.fromJson(song.data());
        bool isFavorite = await isFavoriteSong(songId: song.reference.id);
        // log("favorite ? : $isFavorite");
        songModel.isFavorite = isFavorite;
        songModel.songId = song.reference.id;
        songs.add(songModel.toEntity());
      }
      emit(SongsPlayListSuccess(songs: songs));

      return Right(songs);
    } catch (e) {
      emit(SongsFailure());
      return Left('An error occurred, try again later');
    }
  }

    Future addOrRemoveFavoriteSong({required String songId}) async {
  try {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    // Get the current authenticated user
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final uId = user.uid;

    // Query to check if the song already exists in the favorites
    QuerySnapshot favoriteSongs = await firebaseFirestore
        .collection('Users')
        .doc(uId)
        .collection('Favorites')
        .where('songId', isEqualTo: songId)
        .get();

    late bool isFavorite;

    // If the song is already in favorites, remove it
    if (favoriteSongs.docs.isNotEmpty) {
      await favoriteSongs.docs.first.reference.delete();
      isFavorite = false; // Song was removed from favorites
    } 
    // Otherwise, add the song to the favorites collection
    else {
      await firebaseFirestore
          .collection('Users')
          .doc(uId)
          .collection('Favorites')
          .add({
        'songId': songId,
        'addedDate': Timestamp.now(),
      });
      isFavorite = true; // Song was added to favorites
    }

    return Right(isFavorite);
  } catch (e) {
    return Left('An error occurred: $e');
  }
}
  
  Future<bool> isFavoriteSong({required String songId}) async {
  try {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    // Check if the user is authenticated
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final uId = user.uid;

    // Query the "Favorites" subcollection under the user's document
    QuerySnapshot favoriteSongs = await firebaseFirestore
        .collection('Users')  // Root collection
        .doc(uId)             // Document ID for the user
        .collection('Favorites') // Subcollection 'Favorites'
        .where('songId', isEqualTo: songId)
        .get();

    // If the query returns no documents, the song is not a favorite
    if (favoriteSongs.docs.isEmpty) {
      return false; // Song is NOT a favorite
    } else {
      return true;  // Song IS a favorite
    }
  } catch (e) {
    // Handle any errors (e.g., return false on failure)
    print('Error checking favorite song: $e');
    return false;
  }
}



}
