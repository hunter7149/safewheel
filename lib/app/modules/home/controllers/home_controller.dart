import 'package:get/get.dart';

import '../../../data/api/graphapi.dart';

class HomeController extends GetxController {
  final RxList<dynamic> pokemons = <dynamic>[].obs;

  requestPokemonList() async {
    final String query = '''
query Pokemons {
    pokemons {
        count
        next
        previous
        nextOffset
        prevOffset
        params
        status
        message
        results {
            id
            url
            name
            image
            artwork
            dreamworld
        }
    }
}''';
    try {
      final result = await callGraphQLApi(query);
      if (result != null) {
        pokemons.value = result['pokemons']['results'];
        pokemons.refresh();
        print('GraphQL Response: ${pokemons.value}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    requestPokemonList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
