---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/bloc/<%= h.changeCase.snake(name) %>_state.dart
---
<%
 filename = h.changeCase.snake(name)
%>

import 'package:meta/meta.dart';
import 'package:meta/meta.dart';

@immutable
abstract class <%= name %>State  {
  <%= name %>State();
}

class <%= name %>Loading extends <%= name %>State {}

class <%= name %>Loaded extends <%= name %>State {}

class <%= name %>Error extends <%= name %>State {
  String message;

  <%= name %>Error(this.message);
}
