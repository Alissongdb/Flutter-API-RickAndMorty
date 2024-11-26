import 'dart:convert';
import 'package:flutter_api_rickandmorty/models/localizacao_model.dart';
import 'package:http/http.dart' as http;

class ControllerLocalizacao {
  static const String baseUrl = 'https://rickandmortyapi.com/api/';

  Future<List<Localizacao>> getLocations() async {
    final response = await http.get(Uri.parse('${baseUrl}location'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Localizacao.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar localizações');
    }
  }
}
