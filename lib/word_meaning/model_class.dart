import 'dart:convert';

List<ModelClass> modelClassFromJson(String str) =>
    List<ModelClass>.from(json.decode(str).map((x) => ModelClass.fromJson(x)));

String modelClassToJson(List<ModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClass {
  String word;
  List<Meaning> meanings;
  List<UrduMeaning>? urduMeanings; // Make sure this is defined

  ModelClass({
    required this.word,
    required this.meanings,
    this.urduMeanings, // Initialize as nullable
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
    word: json["word"],
    meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
    urduMeanings: json["urduMeanings"] != null
        ? List<UrduMeaning>.from(json["urduMeanings"].map((x) => UrduMeaning.fromJson(x)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
    "urduMeanings": urduMeanings != null
        ? List<dynamic>.from(urduMeanings!.map((x) => x.toJson()))
        : null, // Handle null case for Urdu meanings
  };
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
    partOfSpeech: json["partOfSpeech"],
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "partOfSpeech": partOfSpeech,
    "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
  };
}

class Definition {
  String definition;
  String? example; // Made nullable
  List<String>? synonyms; // Made nullable

  Definition({
    required this.definition,
    this.example, // Optional
    this.synonyms, // Optional
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    example: json["example"], // Can be null
    synonyms: json["synonyms"] != null ? List<String>.from(json["synonyms"].map((x) => x)) : null, // Can be null
  );

  Map<String, dynamic> toJson() => {
    "definition": definition,
    "example": example, // Can be null
    "synonyms": synonyms != null ? List<dynamic>.from(synonyms!.map((x) => x)) : null, // Can be null
  };
}

class UrduMeaning {
  String meaning;

  UrduMeaning({required this.meaning});

  factory UrduMeaning.fromJson(Map<String, dynamic> json) => UrduMeaning(
    meaning: json["meaning"],
  );

  Map<String, dynamic> toJson() => {
    "meaning": meaning,
  };
}
