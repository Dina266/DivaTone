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

  SongsPlayListSuccess({required this.songs});
}
final class SongsFailure extends SongsState {}
