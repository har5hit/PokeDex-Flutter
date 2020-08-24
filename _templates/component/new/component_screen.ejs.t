---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/screen/<%= h.changeCase.snake(name) %>_screen.dart
---

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../widget/<%= h.changeCase.snake(name) %>_widget.dart';


class <%= name %>Screen extends StatelessWidget {
  <%= name %>Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("<%= name %>Screen"),
      ),
      body: BlocProvider(
        create: (context) {
          return <%= name %>Bloc(
          );
        },
        child: <%= name %>Widget(),
      ),
    );
  }
}
