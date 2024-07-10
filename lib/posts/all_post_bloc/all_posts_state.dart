import '../../models/post_model.dart';

enum AllPostsStatus {
  initial,
  success,
  error,
  loading,
  postSelected,
}

class AllPostsState {
  final AllPostsStatus status;
  final List<Post> posts;
  final Post? selectedPost;
  final String? errorMessage;

  AllPostsState({
    this.status = AllPostsStatus.initial,
    this.posts = const [],
    this.selectedPost,
    this.errorMessage,
  });

  AllPostsState copyWith({
    AllPostsStatus? status,
    List<Post>? posts,
    Post? selectedPost,
    String? errorMessage,
  }) {
    return AllPostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      selectedPost: selectedPost ?? this.selectedPost,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
