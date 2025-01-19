abstract class Failure implements Exception {
  final String message;
  
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message = 'Erro de conexão']) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure([String message = 'Erro no servidor']) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure([String message = 'Erro de cache']) : super(message);
}
