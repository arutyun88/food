abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class DataError extends Failure {
  const DataError(String message) : super(message);
}

class TimeoutError extends Failure {
  const TimeoutError(String message) : super(message);
}

class BadRequest extends Failure {
  const BadRequest(String message) : super(message);
}

class Forbidden extends Failure {
  const Forbidden(String message) : super(message);
}

class NotFound extends Failure {
  const NotFound(String message) : super(message);
}
