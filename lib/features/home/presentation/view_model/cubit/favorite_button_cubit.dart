// import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:diva_tone/features/home/presentation/view_model/cubit_news_songs/songs_cubit.dart';
import 'package:meta/meta.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favouriteButtonUpdated({required String 
  songId}) async{


    var result = await SongsCubit().addOrRemoveFavoriteSong(songId: songId);

    result.fold(
      (l){

      },
      (isFavorite){
        // log("message: $isFavorite");
        emit(
          FavoriteButtonUpdated(isFavorite: isFavorite)
          );
      }
    );
  }
}
