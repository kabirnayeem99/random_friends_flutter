import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_details_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_list_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

const String tag = "RandomFriendsBloc";

class RandomFriendsBloc extends Bloc<RandomFriendsEvent, RandomFriendsState> {
  final GetUserListUseCase _getUserListUseCase = GetUserListUseCase();
  final GetUserDetailsUseCase _getUserDetailsUseCase = GetUserDetailsUseCase();

  RandomFriendsBloc() : super(EmptyRandomFriendsState());

  @override
  Stream<RandomFriendsState> mapEventToState(RandomFriendsEvent event) async* {
    if (event is LoadRandomFriendListEvent) {
      yield LoadingRandomFriendsState();
      final failureOrTrivia = await _getUserListUseCase.call(NoParams());
      yield* _eitherLoadedOrErrorFriendListState(failureOrTrivia);
    } else {
      yield LoadingRandomFriendsState();
      final failureOrTrivia = await _getUserDetailsUseCase.call((event as LoadFriendDetailsEvent).id);
      yield* _eitherLoadedOrErrorFriendDetailState(failureOrTrivia);
    }
  }

  Stream<RandomFriendsState> _eitherLoadedOrErrorFriendDetailState(
      Either<User, Failure> failureOrTrivia) async* {
    yield failureOrTrivia.fold(
          (data) => LoadedFriendDetailState(data),
          (error) => ErrorRandomFriendsState(error.message),
    );
  }

  Stream<RandomFriendsState> _eitherLoadedOrErrorFriendListState(
      Either<List<User>, Failure> failureOrTrivia) async* {
    yield failureOrTrivia.fold(
      (data) => LoadedRandomFriendListState(data),
      (error) => ErrorRandomFriendsState(error.message),
    );
  }
}
