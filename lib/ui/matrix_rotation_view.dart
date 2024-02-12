import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rotate_matrix_flutter/ui/matrix_rotation_controller.dart';
import 'package:rotate_matrix_flutter/ui/matrix_view.dart';

class MatrixRotationView extends StatelessWidget {
  late final MatrixRotationController _matrixRotationController;
  
  MatrixRotationView({super.key, required MatrixRotationController matrixRotationController}) {
    _matrixRotationController = matrixRotationController;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _matrixRotationController,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Matrix Rotator'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: controller.matrixController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese la matriz. Ejemplo: [[1,2],[3,4]]',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.rotateMatrix(),
                  child: const Text('Rotar Imagen'),
                ),
                const SizedBox(height: 16),
                if (controller.matrix.rawValue.isNotEmpty)
                  Text(
                    'Matriz Rotada: ${controller.matrix.rawValue.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                if (controller.matrix.rawValue.isNotEmpty)
                  const SizedBox(height: 16),
                if (controller.matrix.rawValue.isNotEmpty)
                  MatrixView(matrix: controller.matrix),
              ],
            ),
          ),
        );
      }
    );
  }
}