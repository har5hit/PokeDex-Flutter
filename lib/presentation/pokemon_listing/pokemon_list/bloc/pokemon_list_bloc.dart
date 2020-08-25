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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pokedex_flutter/data/pokemon_list/repository/pokemon_list_repository.dart';
import 'package:pokedex_flutter/presentation/pokemon_listing/pokemon_list/bloc/pokemon_list_ui_model.dart';
import 'package:pokedex_flutter/utils/NetworkResult.dart';
import 'package:pokedex_flutter/utils/dev_tools/ILogger.dart';

import 'pokemon_list_event.dart';
import 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonListRepository _repository;

  final ILogger _logger;
  var _offset = 0;
  final _limit = 20;
  var _currentList = <PokemonListUiModel>[];
  var _reachedMax = false;

  PokemonListBloc(this._repository, this._logger) : super(PokemonListLoading());

  @override
  Stream<PokemonListState> mapEventToState(PokemonListEvent event) async* {
    if (event is PokemonListFetch && !_reachedMax) {
      var res = await _repository.loadList(_limit, _offset);
      if (res.status == STATUS.SUCCESS) {
        _offset = _offset + _limit;
        _currentList = _currentList +
            (res.data.results
                .map((e) => PokemonListUiModel.from(e))
                .toList(growable: false));
        _reachedMax = _currentList.length >= res.data.count;
        yield PokemonListLoaded(_currentList, _reachedMax, res.data.count);
      } else {
        if (_currentList.isEmpty) {
          yield PokemonListError(res.message ?? "Error!");
        }
      }
    } else if (event is PokemonListRefresh) {
      _offset = 0;
      _reachedMax = false;
      _currentList = [];
      add(PokemonListFetch());
    }
  }
}
