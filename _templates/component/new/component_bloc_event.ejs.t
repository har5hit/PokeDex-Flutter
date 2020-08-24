---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/bloc/<%= h.changeCase.snake(name) %>_event.dart
---
<%
 filename = h.changeCase.snake(name)
%>

import 'package:meta/meta.dart';

@immutable
abstract class <%= name %>Event  {
  <%= name %>Event();
}

class <%= name %>Fetch extends <%= name %>Event {}