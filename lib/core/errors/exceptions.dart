class ServerException implements Exception {
  final String error;

  const ServerException(this.error);
}
