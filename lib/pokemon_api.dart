import 'dart:convert';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:http/http.dart' as http;


class PokemonApi {
  Future<PokemonModelResponse?> getAllPokemon() async {
    var client = http.Client();
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    var response = await client.get(uri);
    return pokemonFromJson(const Utf8Decoder().convert(response.bodyBytes));
  }
}