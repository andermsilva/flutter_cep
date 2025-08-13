import 'dart:convert';

import 'package:flutter_cep/models/cep_models.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  static const String _baseUrl = 'https://viacep.com.br/ws/';
  final http.Client client;

  CepRepository({required this.client});

  Future<CepModels> consultarCep(String cep) async {
    final cleanCep = cep.replaceAll(r'[^0-9]', '');

    if (cleanCep.length != 8) {
      throw Exception('Cep deve ter exatamente 8 (oito) digitos');
    }
    final url = Uri.parse('$_baseUrl/$cleanCep/json');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData.containsKey('erro')) {
          throw Exception('Cep não encontrado');
        }
        return CepModels.fromJson(jsonData);
      } else {
        throw Exception(
          'Erro na requisição: status code ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Erro na requisição');
    }
  }
}
