import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/pokemon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = PokemonService();

  var isLoading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  getPokemons() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final pokemons = await service.getAllPokemon();

      if (pokemons!.results.isNotEmpty) {
        setState(() {
          this.pokemons = pokemons!.results;
          isLoading = false;
        });
      } else {
        throw Exception(pokemons);
      }
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    if (isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      body = Center(
        child: ElevatedButton(
          onPressed: getPokemons,
          child: Text(error),
        ),
      );
    } else {
      body = ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return ListTile(
              title: Text(pokemon.name),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
      ),
      body: body,
    );
  }
}
