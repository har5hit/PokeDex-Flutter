---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/bloc/<%= h.changeCase.snake(name) %>_bloc.dart
---
<%
 filename = h.changeCase.snake(name)
%>

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '<%= filename %>_event.dart';
import '<%= filename %>_state.dart';

class <%= name %>Bloc extends Bloc<<%= name %>Event, <%= name %>State> {

  <%= name %>Bloc() : super(<%= name %>Loading());

  @override
  Stream<<%= name %>State> mapEventToState(<%= name %>Event event) async* {

  }
}
