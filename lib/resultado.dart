import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontosTotais;

  final void Function() recomecar;

  const Resultado({
    super.key,
    required this.pontosTotais,
    required this.recomecar,
  });

  (String frase, AssetImage image) get itemsPontuacao {
    String frase = '';
    AssetImage image;

    if (pontosTotais >= 100) {
      frase = 'Você é um mestre!';
      image = AssetImage('assets/trofeu.png');
    } else if (pontosTotais >= 60) {
      frase = 'Muito bem pequeno gafanhoto';
      image = AssetImage('assets/pequeno_gafanhoto.jpg');
    } else if (pontosTotais >= 40) {
      frase = 'Precisamos melhorar...';
      image = AssetImage('assets/treinamento.jpg');
    } else {
      frase =
          'Seu gosto é muito ruim meu deus como que você consegue viver com essas escolhas, deve ser horrivel, estou enojado pelo seu pensamento.';
      image = AssetImage('assets/cara_de_nojo.jpg');
    }

    return (frase, image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          itemsPontuacao.$1,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Image(
          image: itemsPontuacao.$2,
        ),
        Text(
          'Você consegui $pontosTotais ${pontosTotais > 1 ? 'pontos' : 'ponto'}',
          style: TextStyle(fontSize: 15),
        ),
        TextButton(
          onPressed: recomecar,
          child: Text(
            'Recomeçar?',
          ),
        )
      ],
    );
  }
}
