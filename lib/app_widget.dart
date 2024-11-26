import 'package:flutter/material.dart';
import 'package:flutter_api_rickandmorty/views/episodios_view.dart';
import 'package:flutter_api_rickandmorty/views/escolha_view.dart';
import 'package:flutter_api_rickandmorty/views/localizacao_view.dart';
import 'package:flutter_api_rickandmorty/views/personagens_view.dart';
import 'package:flutter_api_rickandmorty/views/splash_view.dart';

class MyAPIRickAndMorty extends StatelessWidget {
  const MyAPIRickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashView(),
        '/personagens': (context) => const PersonagensView(),
        '/escolha': (context) => const EscolhaView(),
        '/localizacao': (context) => const LocalizacaoView(),
        '/episodios': (context) => const EpisodiosView(),
      },
    );
  }
}
