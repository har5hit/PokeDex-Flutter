/*
 * Copyright 2020 Harshith Shetty (justadeveloper96@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/constants/RepositoryConstants.dart';
import 'package:pokedex_flutter/data/pokemon_list/model/pokemon_list_response.dart';
import 'package:pokedex_flutter/utils/NetworkResult.dart';

class PokemonListApi {
  Future<NetworkResult<PokemonListResponse>> loadList(
      int limit, int offset) async {
    final url = "$BASE_API_URL/api/v2/pokemon?limit=$limit&offset=$offset";
    try {
      await Future.delayed(Duration(milliseconds: 2000));
      final response = await http.get(url);
      return NetworkResult.handle(
          response, (jsonData) => PokemonListResponse.fromJson(jsonData));
    } catch (e) {
      return NetworkResult.error(message: "No Internet Connection");
    }
  }
}
