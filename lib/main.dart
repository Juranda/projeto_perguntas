import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int perguntaAtual = 0;
  int pontos = 0;

  final List<Map<String, Object>> perguntas = const [
    {
      'image': AssetImage('assets/gorila.jpg'),
      'cor': Colors.green,
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gorila', 'valor': 35},
        {'texto': 'Leão', 'valor': 20},
        {'texto': 'Lobo', 'valor': 10},
      ]
    },
    {
      'image': AssetImage('assets/pessoa_refletindo.jpg'),
      'cor': Colors.purple,
      'texto': 'Qual frase te representa melhor?',
      'respostas': [
        {'texto': 'Eu sou imbatível', 'valor': 35},
        {'texto': 'Não gosto de sair', 'valor': 10},
        {'texto': 'Quero chorar agora', 'valor': 20},
      ]
    },
    {
      'image': AssetImage('assets/personagens_naruto.jpg'),
      'cor': Colors.red,
      'texto': 'Qual o seu pergonagem favorito de Naruto?',
      'respostas': [
        {'texto': 'Jiraya', 'valor': 55},
        {'texto': 'Saske', 'valor': 10},
        {'texto': 'Naruto', 'valor': 40},
        {'texto': 'Sakura', 'valor': 20},
        {'texto': 'Tsunade', 'valor': 45},
      ]
    },
  ];

  void _quandoPergutaSelecionada(int pontosDaResposta) {
    setState(() {
      pontos += pontosDaResposta;
      perguntaAtual++;
    });
  }

  void _recomecarPerguntas() {
    setState(() {
      pontos = 0;
      perguntaAtual = 0;
    });
  }

  get temPerguntaSelecionada {
    return perguntaAtual <= perguntas.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perguntas',
        ),
        centerTitle: true,
        backgroundColor: temPerguntaSelecionada
            ? perguntas[perguntaAtual]['cor'] as Color
            : Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: temPerguntaSelecionada
              ? Questionario(
                  quandoRespostaSelecionada: _quandoPergutaSelecionada,
                  perguntaSelecionada: perguntaAtual,
                  perguntas: perguntas,
                )
              : Resultado(
                  pontosTotais: pontos,
                  recomecar: _recomecarPerguntas,
                ),
        ),
      ),
    );
  }
}
