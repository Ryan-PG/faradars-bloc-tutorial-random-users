import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_users/data/remote_data_source.dart';

import '../../../models/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersFetchData>(getUsersList);
  }

  FutureOr<void> getUsersList(
    UsersFetchData event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoadingInProgress());

    try {
      int numberOfUsers = 10;

      if (event.numberOfUsers != null && event.numberOfUsers != '') {
        numberOfUsers = int.parse(event.numberOfUsers!);
      }

      final usersList = await RemoteDataSource.getUsersList(
        numberOfUsers: numberOfUsers,
      );

      if (usersList == null) {
        emit(
          UsersLoadFailure("Some Errors Occured."),
        );
      } else if (usersList.isEmpty) {
        emit(UsersLoadEmpty());
      } else {
        emit(
          UsersLoadSuccess(
            usersList: usersList,
          ),
        );
      }
    } catch (e) {
      emit(
        UsersLoadFailure(
          e.toString(),
        ),
      );
    }
  }
}
