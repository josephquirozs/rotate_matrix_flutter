import 'package:flutter/material.dart';
import 'package:rotate_matrix_flutter/domain/matrix.dart';

class MatrixView extends StatelessWidget {
  late final Matrix _matrix;

  MatrixView({super.key, required Matrix matrix}) {
    _matrix = matrix;
  }

  @override
  Widget build(BuildContext context) {
    final int n = _matrix.rawValue.length;
    return Table(
      border: TableBorder.all(),
      children: List.generate(
        n,
        (rowIndex) => TableRow(
          children: List.generate(
            n,
            (colIndex) => TableCell(
              child: Center(
                child: Text(
                  _matrix.rawValue[rowIndex][colIndex].toString(),
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}