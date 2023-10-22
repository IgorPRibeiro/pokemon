import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/pokemon_service.dart';
import 'package:pokemon_flutter/pokemon_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = PokemonStore();

  // identify this widget as a listener
  // indentificar esse widget(componente) como um ouvinte
  @override
  void initState() {
    super.initState();
    store.getPokemons();
    store.addListener(() {
      // every time that call a listener in store, will be executed the bellow function
      // toda vez que chamar um listener no store, sera executara a func abaixo
      setState(() {});
      // calling the setState, state of screen will be actualized
      // chamando o setState, ele ira atualizar o estado da tela
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    if (store.isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (store.error.isNotEmpty) {
      body = Center(
        child: ElevatedButton(
          onPressed: store.getPokemons,
          child: Text(store.error),
        ),
      );
    } else {
      body = ListView.builder(
          itemCount: store.pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = store.pokemons[index];
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
