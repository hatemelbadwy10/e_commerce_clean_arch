class Failure {
  String msg;

  Failure({required this.msg});
}

class APIFailure extends Failure {
  int statusCode;

  APIFailure({required this.statusCode, required super.msg});
}

class SQLFailure extends Failure {
  SQLFailure({required super.msg});
}
