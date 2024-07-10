import '../../models/post_model.dart';

abstract class PostDetailEvent {}

class UpdatePostDetail extends PostDetailEvent {
  final Post post;

  UpdatePostDetail(this.post);
}

class DeletePostDetail extends PostDetailEvent {
  final Post postId;

  DeletePostDetail(this.postId);
}