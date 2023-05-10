import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_project/bloc/users_bloc.dart';
//import 'package:github_project/model/users_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UsersBloc>().add(UsersLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("GitHub Users"),
          ),
          body: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoadedState) {
                //return const Center(child: CircularProgressIndicator.adaptive());
                return ListView.builder(
                    itemCount: state.usersModel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(state.usersModel[index].followersUrl),
                      );
                    });
              } else if (state is UsersLoadingState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is UsersErrorState) {
                return Center(
                  child: Text(state.errormessage),
                );
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
