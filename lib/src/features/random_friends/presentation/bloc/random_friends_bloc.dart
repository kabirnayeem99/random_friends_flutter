import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/use_cases/get_user_list_use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_event.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/bloc/random_friends_state.dart';

const String tag = "RandomFriendsBloc";

class RandomFriendsBloc extends Bloc<RandomFriendsEvent, RandomFriendsState> {
  final GetUserListUseCase _getUserListUseCase = GetUserListUseCase();

  RandomFriendsBloc() : super(EmptyRandomFriendsState());

  @override
  Stream<RandomFriendsState> mapEventToState(RandomFriendsEvent event) async* {
    log("mapEventToState is called on $event", tag);
    yield LoadingRandomFriendsState();
    final failureOrTrivia = await _getUserListUseCase.call(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrTrivia);
  }

  Stream<RandomFriendsState> _eitherLoadedOrErrorState(
      Either<List<User>, Failure> failureOrTrivia) async* {
    log("_eitherLoadedOrErrorState is called on ", tag);
    yield failureOrTrivia.fold(
      (data) => LoadedRandomFriendsState(data),
      (error) => ErrorRandomFriendsState(error.message),
    );
  }
}
