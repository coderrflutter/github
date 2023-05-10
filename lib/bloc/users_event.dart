part of 'users_bloc.dart';

abstract class NamelistEvent extends Equatable {
  const NamelistEvent();

  @override
  List<Object> get props => [];
}

class UsersLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
