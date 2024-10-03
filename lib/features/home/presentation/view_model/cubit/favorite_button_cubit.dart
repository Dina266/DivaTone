import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../cubit_news_songs/songs_cubit.dart';
part 'favorite_button_state.dart';


class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void checkIfFavorite({required String songId}) async {
    final result = await SongsCubit().isFavoriteSong(songId: songId);
    emit(FavoriteButtonUpdated(isFavorite: result));
  }

  void toggleFavoriteStatus({required String songId}) async {
    if (state is FavoriteButtonUpdated) {
      final currentState = state as FavoriteButtonUpdated;

      final newFavoriteStatus = !currentState.isFavorite;
      emit(FavoriteButtonUpdated(isFavorite: newFavoriteStatus));

      await SongsCubit().addOrRemoveFavoriteSong(songId: songId);
      
    }
  }
}
