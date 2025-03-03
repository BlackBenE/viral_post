import '../../models/post_model.dart';

enum PostDetailStatus {
  initial,
  loading,
  success,
  error,
  updating,
  deleting,
}class PostDetailState {
  final PostDetailStatus status;
  final List<Post> posts;
  final Post? selectedPost;
  final String? errorMessage;

  PostDetailState({
    this.status = PostDetailStatus.initial,
    this.posts = const [],
    this.selectedPost,
    this.errorMessage,
  });

  PostDetailState copyWith({
    PostDetailStatus? status,
    List<Post>? posts,
    Post? selectedPost,
    String? errorMessage,
  }) {
    return PostDetailState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      selectedPost: selectedPost ?? this.selectedPost,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}