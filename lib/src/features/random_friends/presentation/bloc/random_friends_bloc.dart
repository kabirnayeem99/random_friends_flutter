import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_list_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

class RandomFriendsBloc extends Bloc<RandomFriendsEvent, RandomFriendsState> {
  late GetUserListUseCase _getUserListUseCase;
  RandomFriendsState _initialState = LoadingRandomFriendsState();

  RandomFriendsBloc(this._getUserListUseCase, this._initialState)
      : super(_initialState) {
    _getUserListUseCase = GetUserListUseCase();
    _initialState = LoadingRandomFriendsState();
  }

  @override
  Stream<RandomFriendsState> mapEventToState(RandomFriendsEvent event) async* {
    yield LoadingRandomFriendsState();
    final failureOrTrivia = await _getUserListUseCase.call(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrTrivia);
  }

  Stream<RandomFriendsState> _eitherLoadedOrErrorState(
      Either<List<User>, Failure> failureOrTrivia) async* {
    yield failureOrTrivia.fold(
      (data) => LoadedRandomFriendsState(data),
      (error) => ErrorRandomFriendsState(error.message),
    );
  }
}
