import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta({
    required this.texto,
    required this.quandoResposta,
    required this.cor,
  });

  final Color cor;
  final void Function() quandoResposta;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: quandoResposta,
          child: Text(this.texto),
          style: ElevatedButton.styleFrom(backgroundColor: cor)),
    );
  }
}
