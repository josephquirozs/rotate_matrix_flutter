class MatrixCreationException implements Exception {
  final String message;

  MatrixCreationException(this.message);

  @override
  String toString() {
    return 'MatrixCreationException: $message';
  }
}