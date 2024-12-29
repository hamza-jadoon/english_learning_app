import 'package:english_learning_app/word_meaning/translate_services.dart';
import 'package:flutter/material.dart';
import 'model_class.dart';

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final DictionaryService _dictionaryService = DictionaryService();
  final TextEditingController _controller = TextEditingController();
  List<ModelClass>? _meanings;
  String? _errorMessage;

  void _fetchMeaning() async {
    setState(() {
      _meanings = null; // Reset meanings
      _errorMessage = null; // Reset error message
    });
    try {
      final word = _controller.text.trim();
      if (word.isNotEmpty) {
        final meanings = await _dictionaryService.getWordMeaning(word);
        setState(() {
          _meanings = meanings;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Translator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a word',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _fetchMeaning,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            if (_meanings != null) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: _meanings!.length,
                  itemBuilder: (context, index) {
                    final model = _meanings![index];
                    return ListTile(
                      title: Text(model.word),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display English meanings
                          ...model.meanings.map((meaning) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Part of Speech: ${meaning.partOfSpeech}'),
                                ...meaning.definitions.map((definition) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Definition: ${definition.definition}'),
                                        if (definition.example != null)
                                          Text('Example: ${definition.example!}', style: TextStyle(color: Colors.grey[600])),
                                        if (definition.synonyms != null && definition.synonyms!.isNotEmpty)
                                          Text('Synonyms: ${definition.synonyms!.join(', ')}', style: TextStyle(color: Colors.grey[600])),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            );
                          }).toList(),

                          SizedBox(height: 10), // Space between English and Urdu meanings

                          // Display Urdu meanings
                          ...?model.urduMeanings?.map((urduMeaning) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                'Urdu Meaning: ${urduMeaning.meaning}',
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList() ?? [], // Ensure this is set to display correctly
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ],
        ),
      ),
    );
  }
}
