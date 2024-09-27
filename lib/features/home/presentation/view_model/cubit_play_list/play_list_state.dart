part of 'play_list_cubit.dart';

@immutable
sealed class PlayListState {}

final class PlayListInitial extends PlayListState {}
final class PlayListLoading extends PlayListState {}
final class PlayListSuccess extends PlayListState {
  final List<SongEntity> playList;

  PlayListSuccess({required this.playList});
}
final class PlayListFailure extends PlayListState {}
