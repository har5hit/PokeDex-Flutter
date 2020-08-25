---
to: lib/data/<%= h.changeCase.snake(name) %>/network/<%= h.changeCase.snake(name) %>_api.dart
---

import 'package:pokedex_flutter/utils/NetworkResult.dart';
import 'package:http/http.dart' as http;
import '../model/<%= h.changeCase.snake(name) %>_response.dart';

class <%= name %>Api{
  Future<NetworkResult<<%= name %>Response>> get() async {
    final url = "";
    final response = await http.get(url);
    return NetworkResult.handle(
        response, (jsonData) => <%= name %>Response.fromJson(jsonData));
  }
}