part of 'get_user_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}
final class GetUserLoading extends GetUserState {}
final class GetUserSuccess extends GetUserState {
  final UserModelEntity userEntity;

  GetUserSuccess({required this.userEntity});
}
final class GetUserFailure extends GetUserState {}
