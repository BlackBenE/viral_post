import 'package:equatable/equatable.dart';
import '../../models/post_model.dart';

abstract class CreatePostsEvent extends Equatable {
  const CreatePostsEvent();

  @override
  List<Object?> get props => [];
}

class CreatePost extends CreatePostsEvent {
  final Post post;

  const CreatePost(this.post);

  @override
  List<Object?> get props => [post];
}
