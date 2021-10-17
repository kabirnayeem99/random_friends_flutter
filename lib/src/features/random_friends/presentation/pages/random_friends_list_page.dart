import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_friends_flutter/src/core/widgets/circular_progress_indicator_widget.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_bloc.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/widgets/random_friends_list_widget.dart';

class RandomFriendsListPage extends StatelessWidget {
  static const routeName = "/randomFriendsListPage";

  const RandomFriendsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(),
      body: _buildBody(context),
    );
  }

  BlocProvider<RandomFriendsBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomFriendsBloc()..add(LoadRandomFriendListEvent()),
      child: BlocBuilder<RandomFriendsBloc, RandomFriendsState>(
        builder: (context, state) {
          if (state is LoadingRandomFriendsState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is ErrorRandomFriendsState) {
            return Center(child: Text("Error: " + state.message));
          } else if (state is LoadedRandomFriendListState) {
            return RandomFriendsListWidget(userList: state.userList);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
