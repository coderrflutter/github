import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_project/Screen/home_screen.dart';
import 'package:github_project/bloc/users_bloc.dart';
import 'package:github_project/repo/users_repo.dart';

import 'debug/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(RepositoryProvider(
    lazy: true,
    create: (context) => UsersRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(UsersRepo()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
