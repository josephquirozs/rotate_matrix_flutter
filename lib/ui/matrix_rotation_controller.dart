import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rotate_matrix_flutter/domain/matrix.dart';
import 'package:rotate_matrix_flutter/domain/matrix_creation_exception.dart';
import 'package:rotate_matrix_flutter/usecase/matrix_rotation.dart';

class MatrixRotationController extends GetxController {
  late final MatrixRotation _matrixRotation;
  late final TextEditingController matrixController;
  late Matrix matrix = Matrix(rawValue: []);

  MatrixRotationController({required MatrixRotation matrixRotation}) {
    _matrixRotation = matrixRotation;
  }

  @override
  void onInit() {
    matrixController = TextEditingController(text: '');
    // matrixController = TextEditingController(text: '[[1,2],[3,4]]');
    // matrixController = TextEditingController(text: '[[1,2,3],[4,5,6],[7,8,9]]');
    // matrixController = TextEditingController(text: '[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]');
    super.onInit();
  }

  void rotateMatrix() {
      final Either<MatrixCreationException, Matrix> newMatrix = Matrix.fromText(matrixController.text);
      if (newMatrix.isLeft()) {
        _showMessage('Matriz inválida.');
        return;
      }
      newMatrix.foldRight(null, (rigth, previous) {
        matrix = _matrixRotation.rotate(rigth);
        update();
      });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}