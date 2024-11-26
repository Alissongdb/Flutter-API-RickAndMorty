import 'package:flutter/material.dart';
import 'package:flutter_api_rickandmorty/controllers/controller_localizacao.dart';
import 'package:flutter_api_rickandmorty/models/localizacao_model.dart';

class LocalizacaoView extends StatefulWidget {
  const LocalizacaoView({super.key});

  @override
  State<LocalizacaoView> createState() => _HomeViewState();
}

class _HomeViewState extends State<LocalizacaoView> {
  late Future<List<Localizacao>> localizacao;

  @override
  void initState() {
    super.initState();
    localizacao = ControllerLocalizacao().getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localizações de Rick and Morty'),
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
        child: FutureBuilder<List<Localizacao>>(
          future: localizacao,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('Nenhuma localização encontrada'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final localizacaoItem = snapshot.data![index];
                return ListTile(
                  title: Text(localizacaoItem.name),
                  subtitle: Text(
                    'ID: ${localizacaoItem.id}\nType: ${localizacaoItem.type}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  leading: null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
