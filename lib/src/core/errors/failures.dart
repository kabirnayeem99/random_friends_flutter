abstract class Failure {
  String message = "";
}

class ServerFailure implements Failure {
  @override
  String message = "Could not load from server";
}
