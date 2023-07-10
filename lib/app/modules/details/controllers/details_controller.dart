import 'package:get/get.dart';

import '../../../data/api/graphapi.dart';

class DetailsController extends GetxController {
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;
  RxString name = ''.obs;
  updateName({required String data}) {
    name.value = data;
    update();
    requestPokemonList(pokemon: data);
  }

  updateImage({required String data}) {
    imageUrl.value = data;
    update();
  }

  RxMap<String, dynamic> pokemons = <String, dynamic>{}.obs;

  requestPokemonList({required String pokemon}) async {
    isLoading.value = true;
    update();
    final String query = '''
query Pokemon {
    pokemon(name: "${pokemon}") {
        base_experience
        height
        id
        is_default
        location_area_encounters
        name
        order
        weight
        status
        message
    }
}
''';
    try {
      final result = await callGraphQLApi(query);
      if (result != null) {
        pokemons.value = result['pokemon'];
        pokemons.refresh();
        print('GraphQL Response: ${pokemons.value}');
      }
    } catch (e) {
      print('Error: $e');
    }
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    dynamic data = Get.arguments;
    updateName(data: data['name'] ?? '');
    updateImage(data: data['image'] ?? '');
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
