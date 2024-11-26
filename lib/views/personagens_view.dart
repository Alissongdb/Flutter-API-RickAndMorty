// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_api_rickandmorty/controllers/controller_personagens.dart';
import 'package:flutter_api_rickandmorty/models/personagens_model.dart';

class PersonagensView extends StatefulWidget {
  const PersonagensView({super.key});

  @override
  State<PersonagensView> createState() => _HomeViewState();
}

class _HomeViewState extends State<PersonagensView> {
  late Future<List<Personagens>> personagens;

  @override
  void initState() {
    super.initState();
    personagens = ControllerPersonagens().getPersonagens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens de Rick and Morty'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2BE2), // Roxo
              Color(0xFF6495ED), // Azul
              Color(0xFFD8BFD8), // Lilás
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<Personagens>>(
          future: personagens,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum personagem encontrado'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final personagem = snapshot.data![index];
                return ListTile(
                  title: Text(personagem.name),
                  subtitle: Text(personagem.status),
                  leading: personagem.image != null
                      ? Image.network(personagem.image)
                      : null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
