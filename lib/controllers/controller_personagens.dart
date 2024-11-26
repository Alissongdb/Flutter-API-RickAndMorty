import 'dart:convert';
import 'package:flutter_api_rickandmorty/models/personagens_model.dart';
import 'package:http/http.dart' as http;

class ControllerPersonagens {
  static const String baseUrl = 'https://rickandmortyapi.com/api/';

  Future<List<Personagens>> getPersonagens() async {
    final response = await http.get(Uri.parse('${baseUrl}character'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Personagens.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar personagens');
    }
  }
}
