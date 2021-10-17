import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/core/widgets/circular_progress_indicator_widget.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_bloc.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

const tag = "RandomFriendDetailsPage";

class RandomFriendDetailsPage extends StatelessWidget {
  static const routeName = "/randomFriendsListPage";

  const RandomFriendDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userId = ModalRoute.of(context)!.settings.arguments as List<String>;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white.withOpacity(0.5),
        middle: Text(userId[0]),
      ),
      child: Scaffold(
        body: _buildBody(context, userId[0]),
      ),
    );
  }

  BlocProvider<RandomFriendsBloc> _buildBody(
      BuildContext context, String userId) {
    return BlocProvider(
      create: (_) => RandomFriendsBloc()..add(LoadFriendDetailsEvent(userId)),
      child: BlocBuilder<RandomFriendsBloc, RandomFriendsState>(
        builder: (context, state) {
          if (state is LoadingRandomFriendsState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is ErrorRandomFriendsState) {
            return Center(child: Text("Error: " + state.message));
          } else if (state is LoadedFriendDetailState) {
            log("the state is ${state.user.name}", tag);
            return Container(child: Center(child: Text(state.user.name)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
