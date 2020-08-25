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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_flutter/data/constants/RepositoryConstants.dart';
import 'package:pokedex_flutter/presentation/pokemon_listing/pokemon_list/bloc/pokemon_list_ui_model.dart';

class PokemonListItemWidget extends StatefulWidget {
  final PokemonListUiModel data;

  PokemonListItemWidget(this.data);

  @override
  _PokemonListItemWidgetState createState() => _PokemonListItemWidgetState();
}

class _PokemonListItemWidgetState extends State<PokemonListItemWidget> {
  @override
  void initState() {
    super.initState();
    getPalette();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.data.background,
        child: Container(
          height: 150,
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CachedNetworkImage(imageUrl: imageUrl(widget.data.url)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                caps(widget.data.name),
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ));
  }

  void getPalette() async {
    final palette = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(imageUrl(widget.data.url)));
    setState(() {
      widget.data.background = palette.dominantColor.color;
    });
  }
}

String caps(String text) {
  final first = text.substring(0, 1).toUpperCase();
  final last = text.substring(1, text.length);
  return first + last;
}