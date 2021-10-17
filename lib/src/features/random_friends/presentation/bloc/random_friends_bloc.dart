import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_list_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

class RandomFriendsBloc extends Bloc<RandomFriendsEvent, RandomFriendsState> {
  final GetUserListUseCase _getUserListUseCase = GetUserListUseCase();

  RandomFriendsBloc() : super(EmptyRandomFriendsState()) {
    log("check if log working or not", "RandomFriendsBloc");
    _getUserListUseCase.call(NoParams());
  }

  @override
  Stream<RandomFriendsState> mapEventToState(RandomFriendsEvent event) async* {
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
