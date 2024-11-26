import 'dart:convert';
import 'package:flutter_api_rickandmorty/models/episodios_model.dart';
import 'package:http/http.dart' as http;

class ControllerEpisodios {
  static const String baseUrl = 'https://rickandmortyapi.com/api/';

  Future<List<Episodios>> getEpisodios() async {
    final response = await http.get(Uri.parse('${baseUrl}episode'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Episodios.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar episódios');
    }
  }
}
