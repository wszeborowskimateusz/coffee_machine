abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(String method)
      : super('Server failure occurred when calling: $method');
}

class GeneralFailure extends Failure {
  const GeneralFailure(String errorMessage)
      : super('An unexpected error occur: $errorMessage');
}
