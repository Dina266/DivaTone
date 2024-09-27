part of 'songs_cubit.dart';

@immutable
sealed class SongsState {}

final class SongsInitial extends SongsState {}
final class SongsLoading extends SongsState {}
final class SongsSuccess extends SongsState {
  final List<SongEntity> songs;

  SongsSuccess({required this.songs});
}
final class SongsFailure extends SongsState {}
