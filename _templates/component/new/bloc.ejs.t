---
to: lib/presentation/<%= h.changeCase.snake(module) %>/<%= h.changeCase.snake(name) %>/bloc/bloc.dart
---
<%
 component = h.changeCase.snake(name)
%>

export '<%= component %>_bloc.dart';
export '<%= component %>_event.dart';
export '<%= component %>_state.dart';

