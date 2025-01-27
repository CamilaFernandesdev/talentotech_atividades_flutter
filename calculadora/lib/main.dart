import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          displaySmall: TextStyle(color: Colors.orange, fontSize: 24),
          displayMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: CalculadoraHome(),
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  const CalculadoraHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  String expressao = "";
  String resultado = "0";

  void adicionarExpressao(String valor) {
    setState(() {
      expressao += valor;
    });
  }

  void calcularResultado() {
    try {
      final parser = Parser();
      final exp = parser.parse(expressao.replaceAll('x', '*'));
      final contexto = ContextModel();
      resultado = "${exp.evaluate(EvaluationType.REAL, contexto)}";
    } catch (e) {
      resultado = "Erro";
    }
    setState(() {});
  }

  void limparTudo() {
    setState(() {
      expressao = "";
      resultado = "0";
    });
  }

  Widget criarBotao(String texto, {Color? cor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor ?? Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            if (texto == "C") {
              limparTudo();
            } else if (texto == "=") {
              calcularResultado();
            } else {
              adicionarExpressao(texto);
            }
          },
          child: Text(
            texto,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16),
              child: Text(
                expressao,
                style: TextStyle(color: Colors.orange, fontSize: 32),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(16),
            child: Text(
              resultado,
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
          ),
          Divider(color: Colors.orange),
          Column(
            children: [
              Row(
                children: [
                  criarBotao("7"),
                  criarBotao("8"),
                  criarBotao("9"),
                  criarBotao("/", cor: Colors.grey),
                ],
              ),
              Row(
                children: [
                  criarBotao("4"),
                  criarBotao("5"),
                  criarBotao("6"),
                  criarBotao("x", cor: Colors.grey),
                ],
              ),
              Row(
                children: [
                  criarBotao("1"),
                  criarBotao("2"),
                  criarBotao("3"),
                  criarBotao("-", cor: Colors.grey),
                ],
              ),
              Row(
                children: [
                  criarBotao("C", cor: Colors.red),
                  criarBotao("0"),
                  criarBotao("="),
                  criarBotao("+", cor: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
