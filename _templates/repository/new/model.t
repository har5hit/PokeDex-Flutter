---
to: lib/data/<%= h.changeCase.snake(name) %>/model/<%= h.changeCase.snake(name) %>_response.dart
---
class <%= name %>Response{

  String id;

  <%= name %>Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}