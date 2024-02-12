import 'package:dartz/dartz.dart';
import 'package:rotate_matrix_flutter/domain/matrix_creation_exception.dart';

class Matrix {
  static const int _maxN = 9;
  final List<List<int>> rawValue;

  Matrix({required this.rawValue});

  static bool _isValidText(String text) {
    final RegExp regexp = RegExp(r'^\[\[(\d+(,\d+)*)\](,\[(\d+(,\d+)*)\])*\]$');
    return regexp.hasMatch(text);
  }

  static int? _deductN(int totalElements) {
    if (totalElements == 4) {
      return 2;
    }
    for (int i = 3; i <= _maxN; i++) {
      if (totalElements % i == 0) {
        return i;
      }
    }
    return null;
  }

  static Either<MatrixCreationException, Matrix> fromText(String text) {
    if (!_isValidText(text)) {
      return Left(MatrixCreationException('Matrix text is wrong'));
    }
    final String withoutBrackets = text.replaceAll('[', '').replaceAll(']', '');
    final List<String> elements = withoutBrackets.split(',');
    final int? n = _deductN(elements.length);
    if (n == null) {
      return Left(MatrixCreationException('Matrix n cannot be deducted'));
    }
    final List<List<int>> rawMatrix = List.generate(n, (_) => List<int>.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        rawMatrix[i][j] = int.parse(elements[i * n + j]);
      }
    }
    return Right(Matrix(rawValue: rawMatrix));
  }
}