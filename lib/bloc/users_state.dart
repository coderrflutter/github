part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UsersModel> usersModel;
  const UsersLoadedState(this.usersModel);
  @override
  List<Object> get props => [usersModel];
}

class UsersErrorState extends UsersState {
  final String errormessage;

  const UsersErrorState(this.errormessage);
  @override
  List<Object> get props => [errormessage];
}
