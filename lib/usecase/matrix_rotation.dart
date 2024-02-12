import 'package:rotate_matrix_flutter/domain/matrix.dart';

class MatrixRotation {
  Matrix rotate(Matrix matrix) {
    final int n = matrix.rawValue.length;
    final List<List<int>> rotatedMatrix = List.generate(n, (_) => List.filled(n, 0));
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        rotatedMatrix[n - 1 - j][i] = matrix.rawValue[i][j];
      }
    }
    return Matrix(rawValue: rotatedMatrix);
  }
}