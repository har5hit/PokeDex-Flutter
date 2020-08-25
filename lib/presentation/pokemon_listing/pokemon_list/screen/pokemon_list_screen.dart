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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/data/pokemon_list/repository/pokemon_list_repository.dart';
import 'package:pokedex_flutter/presentation/pokemon_listing/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_flutter/utils/dev_tools/Logger.dart';

import '../bloc/bloc.dart';
import '../widget/pokemon_list_widget.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokemonListScreen"),
      ),
      body: BlocProvider(
        create: (context) {
          return PokemonListBloc(
              context.repository<PokemonListRepository>(), Logger())
            ..add(PokemonListFetch());
        },
        child: PokemonListWidget(),
      ),
    );
  }
}
