import 'dart:convert';

PokemonModelResponse pokemonFromJson(String str) => PokemonModelResponse.fromJson(json.decode(str));

String pokemonToJson(PokemonModelResponse data) => json.encode(data.toJson());

class PokemonModelResponse {
  int count;
  String next;
  dynamic previous;
  List<Pokemon> results;

  PokemonModelResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonModelResponse.fromJson(Map<String, dynamic> json) => PokemonModelResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Pokemon {
  String name;
  String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}