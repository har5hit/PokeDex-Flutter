---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/widget/<%= h.changeCase.snake(name) %>_widget.dart
---

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class <%= name %>Widget extends StatelessWidget {
  <%= name %>Widget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("<%= name %>Widget");
  }
}
