import 'dart:convert';

class Todo {
  String? id;
  String? text;
  String? description;

  Todo({
    this.id,
    this.text,
    this.description,
  });
                //fromMap
  factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));
        //toJson
  String toRawJson() => json.encode(toJson());

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    text: json["text"],
    description: json["description"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "description": description,
  };
}
