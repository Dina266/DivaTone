part of 'songs_cubit.dart';

@immutable
sealed class SongsState {}

final class SongsInitial extends SongsState {}
final class SongsPlayListLoading extends SongsState {}
final class SongsNewsLoading extends SongsState {}
final class SongsNewsSuccess extends SongsState {
  final List<SongEntity> songs;

  SongsNewsSuccess({required this.songs});
}
final class SongsPlayListSuccess extends SongsState {
  final List<SongEntity> songs;
  final List<SongEntity> favSongs;

  SongsPlayListSuccess(this.favSongs, {required this.songs});
}
final class SongsFailure extends SongsState {}
final class FavSongState extends SongsState {
  final List<SongEntity> favSongs;

  FavSongState({required this.favSongs});
}
