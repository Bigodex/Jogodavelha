// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jogodavelha/EstruturaTela/jogosolo.dart';
import 'package:jogodavelha/EstruturaTela/jogoversus.dart';
import 'package:jogodavelha/EstruturaTela/opcoes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo igual à tela de abertura
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Alinhando os botões na parte inferior
            children: <Widget>[
              const Text(
                'Jogo da Velha',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Espaço entre o título e o card
              Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Alinhando os botões na parte inferior
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity, // Ocupa toda a largura disponível
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const JogoSolo(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Cor do botão azul
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0), // Arredonda os cantos
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20), // Tamanho do botão
                            child: Text(
                              'Jogo Solo',
                              style: TextStyle(
                                color: Colors.white, // Texto branco
                                fontWeight: FontWeight.bold, // Negrito
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Espaço entre os botões

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: double.infinity, // Ocupa toda a largura disponível
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => const JogoVersus(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                        );
                                      },
                                    ),
                                  );                                 // Ação para o botão "Não tenho conta"
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black, // Cor cinza
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0), // Arredonda os cantos
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20), // Tamanho do botão
                                  child: Text(
                                    'Jogo Versus',
                                    style: TextStyle(
                                      color: Colors.white, // Texto mais claro
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Espaço entre os botões
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: double.infinity, // Ocupa toda a largura disponível
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => const Opcoes(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                        );
                                      },
                                    ),
                                  );
                                  // Ação para o botão "Não tenho conta"
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black, // Cor cinza
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0), // Arredonda os cantos
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20), // Tamanho do botão
                                  child: Text(
                                    'Opções',
                                    style: TextStyle(
                                      color: Colors.white, // Texto mais claro
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Espaço entre a linha "Ou" e os botões
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(95, 95, 95, 95), // Cor de fundo do Scaffold
    ),
  ));
}
