import 'package:flutter/material.dart';
import 'package:flutter_api_rickandmorty/controllers/constroller_episodios.dart';

import 'package:flutter_api_rickandmorty/models/episodios_model.dart';

class EpisodiosView extends StatefulWidget {
  const EpisodiosView({super.key});

  @override
  State<EpisodiosView> createState() => _EpisodiosViewState();
}

class _EpisodiosViewState extends State<EpisodiosView> {
  late Future<List<Episodios>> episodios;

  @override
  void initState() {
    super.initState();
    episodios = ControllerEpisodios().getEpisodios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episódios de Rick and Morty'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2BE2), // Cor roxa
              Color(0xFF6495ED), // Cor azul
              Color(0xFFD8BFD8), // Cor lilás
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<Episodios>>(
          future: episodios,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum episódio encontrado'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final episodioItem = snapshot.data![index];
                return ListTile(
                  title: Text(episodioItem.name),
                  subtitle: Text(
                    'Episódio: ${episodioItem.episode}\nData de Lançamento: ${episodioItem.airDate}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
