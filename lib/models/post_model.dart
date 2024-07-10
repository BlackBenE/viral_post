import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String name;
  final String description;

  const Post({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      name: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [id, name, description];
}