import '../../models/post_model.dart';

enum CreatePostStatus {
  initial,
  success,
  error,
  loading,
}

class CreatePostState {
  final CreatePostStatus status;
  final List<Post> posts;
  final String? errorMessage;

  CreatePostState({
    this.status = CreatePostStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  CreatePostState copyWith({
    CreatePostStatus? status,
    List<Post>? posts,
    Post? selectedPost,
    String? errorMessage,
  }) {
    return CreatePostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
