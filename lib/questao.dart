import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  const Questao(this.texto, {super.key});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
