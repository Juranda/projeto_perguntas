import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoRespostaSelecionada;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoRespostaSelecionada,
  });

  get temPerguntaSelecionada {
    return perguntaSelecionada <= perguntas.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> pergunta = perguntas[perguntaSelecionada].cast();

    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? pergunta['respostas'] as List<Map<String, Object>>
        : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Questao(pergunta['texto'] as String),
        Image(
          image: pergunta['image'] as AssetImage,
        ),
        Column(
          children: [
            ...respostas.map(
              (resp) => Resposta(
                texto: resp['texto'] as String,
                quandoResposta: () =>
                    quandoRespostaSelecionada(resp['valor'] as int),
                cor: pergunta['cor'] as Color,
              ),
            ),
          ],
        )
      ],
    );
  }
}
