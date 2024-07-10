import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viral_post/post_detail/post_detail_bloc/post_detail_event.dart';
import 'package:viral_post/posts/post_repository.dart';
import 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostRepository postRepository;

  PostDetailBloc({required this.postRepository}) : super(PostDetailState()) {
    on<UpdatePostDetail>(_onUpdatePostDetail);
    on<DeletePostDetail>(_onDeletePostDetail);
  }

  void _onUpdatePostDetail(UpdatePostDetail event, Emitter<PostDetailState> emit) async {
    emit(state.copyWith(status: PostDetailStatus.updating));
    try {
      await postRepository.updatePost(event.post);
      emit(state.copyWith(status: PostDetailStatus.success, selectedPost: event.post));
    } catch (e) {
      emit(state.copyWith(status: PostDetailStatus.error, errorMessage: e.toString()));
    }
  }

  void _onDeletePostDetail(DeletePostDetail event, Emitter<PostDetailState> emit) async {
    emit(state.copyWith(status: PostDetailStatus.deleting));
    try {
      await postRepository.deletePost(event.postId as int);
      emit(state.copyWith(status: PostDetailStatus.success, selectedPost: null));
    } catch (e) {
      emit(state.copyWith(status: PostDetailStatus.error, errorMessage: e.toString()));
    }
  }
}