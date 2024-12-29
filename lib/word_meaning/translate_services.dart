import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model_class.dart';

class DictionaryService {
  Future<List<ModelClass>?> getWordMeaning(String word) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
    );

    if (response.statusCode == 200) {
      return modelClassFromJson(response.body);
    } else {
      throw Exception('Failed to load meaning: ${response.reasonPhrase}');
    }
  }
}
