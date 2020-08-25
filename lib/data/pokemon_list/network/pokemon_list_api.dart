import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/constants/RepositoryConstants.dart';
import 'package:pokedex_flutter/data/pokemon_list/model/pokemon_list_response.dart';
import 'package:pokedex_flutter/utils/NetworkResult.dart';

class PokemonListApi {
  Future<NetworkResult<PokemonListResponse>> loadList(
      int limit, int offset) async {
    final url = "$BASE_NETWORK_URL/api/v2/pokemon?limit=$limit&offset=$offset";
    final response = await http.get(url);
    return NetworkResult.handle(
        response, (jsonData) => PokemonListResponse.fromJson(jsonData));
  }
}
