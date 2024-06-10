import 'package:flutter/material.dart';
import 'package:jogodavelha/EstruturaTela/abertura.dart';
import 'package:jogodavelha/EstruturaTela/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Velha',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const Abertura(),
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Home(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        }
        return null;
      },
    );
  }
}

