part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoadingInProgress extends UsersState {}

final class UsersLoadSuccess extends UsersState {
  final List<User> usersList;

  UsersLoadSuccess({
    required this.usersList,
  });
}

final class UsersLoadFailure extends UsersState {
  final String? message;

  UsersLoadFailure(this.message);
}

final class UsersLoadEmpty extends UsersState {}
