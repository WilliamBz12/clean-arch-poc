class CustomFailure implements Exception {
  final String message;
  final ErrorType? errorType;
  CustomFailure({
    required this.message,
    this.errorType,
  });
}

enum ErrorType {
  notAuthenticated,
  notFound,
}
