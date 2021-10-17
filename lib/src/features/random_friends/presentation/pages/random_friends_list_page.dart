import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_list_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_bloc.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

class RandomFriendsListPage extends StatelessWidget {
  static const routeName = "/randomFriendsListPage";

  final GetUserListUseCase _getUserListUseCase = GetUserListUseCase();
  final RandomFriendsState _initialState = LoadingRandomFriendsState();

  RandomFriendsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _buildBody(context))),
    );
  }

  BlocProvider<RandomFriendsBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomFriendsBloc(),
      child: BlocBuilder<RandomFriendsBloc, RandomFriendsState>(
        builder: (context, state) {
          if (state is LoadingRandomFriendsState) {
            return const CircularProgressIndicator();
          } else if (state is ErrorRandomFriendsState) {
            return Center(child: Text("Error: " + state.message));
          } else if (state is LoadedRandomFriendsState) {
            return Center(child: Text("Data: " + state.userList.first.name));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
