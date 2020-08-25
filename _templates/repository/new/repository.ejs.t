---
to: lib/data/<%= h.changeCase.snake(name) %>/repository/<%= h.changeCase.snake(name) %>_repository.dart
---
import 'package:pokedex_flutter/utils/NetworkResult.dart';
import '../model/<%= h.changeCase.snake(name) %>_response.dart';
import '../network/<%= h.changeCase.snake(name) %>_api.dart';

class <%= name %>Repository{

  final <%= name %>Api _network;

  <%= name %>Repository(this._network);

  Future<NetworkResult<<%= name %>Response>> get() async {
    return await _network.get();
  }

}