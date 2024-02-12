import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rotate_matrix_flutter/ui/matrix_rotation_controller.dart';
import 'package:rotate_matrix_flutter/ui/matrix_rotation_view.dart';
import 'package:rotate_matrix_flutter/usecase/matrix_rotation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatrixRotationView(
        matrixRotationController: MatrixRotationController(
          matrixRotation: MatrixRotation(),
        ),
      ),
    );
  }
}