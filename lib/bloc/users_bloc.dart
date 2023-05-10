import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_project/model/users_model.dart';
import 'package:github_project/repo/users_repo.dart';
import 'package:http/http.dart' as http;

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersLoadedEvent, UsersState> {
  final UsersRepo usersRepo;
  UsersBloc(this.usersRepo) : super(UsersLoadingState()) {
    on<UsersLoadedEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());
        var data = await usersRepo.getUsers();
        emit(UsersLoadedState(data));
      } catch (e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }
}
