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

import 'package:meta/meta.dart';
import 'package:pokedex_flutter/presentation/pokemon_listing/pokemon_list/bloc/pokemon_list_ui_model.dart';
import 'package:pokedex_flutter/utils/pagination/PaginatedListState.dart';

@immutable
abstract class PokemonListState implements PaginatedListState {
  PokemonListState();
}

class PokemonListLoading extends PokemonListState implements ListLoading {}

class PokemonListLoaded extends PokemonListState
    implements ListLoaded<PokemonListUiModel> {
  final List<PokemonListUiModel> list;
  final bool hasReachedMax;
  final int total;

  PokemonListLoaded(this.list, this.hasReachedMax, this.total);

  @override
  String toString() {
    return 'PokemonListLoaded{currentList: $list, hasReachedMax: $hasReachedMax, total: $total}';
  }
}

class PokemonListError extends PokemonListState implements ListError {
  final String message;

  PokemonListError(this.message);

  @override
  String toString() {
    return 'PokemonListError{message: $message}';
  }
}
