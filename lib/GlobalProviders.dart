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

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/data/pokemon_list/network/pokemon_list_api.dart';
import 'package:pokedex_flutter/data/pokemon_list/repository/pokemon_list_repository.dart';
import 'package:pokedex_flutter/utils/dev_tools/Logger.dart';

Widget globalProviders(Widget rootWidget) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
          create: (context) =>
              PokemonListRepository(Logger(), PokemonListApi()))
    ],
    child: rootWidget,
  );
}
