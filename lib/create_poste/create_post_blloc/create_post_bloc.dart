import 'package:bloc/bloc.dart';
import '../../posts/post_repository.dart';
import 'create_post_event.dart';
import 'create_post_state.dart';

class CreatePostsBloc extends Bloc<CreatePostsEvent, CreatePostState> {
  final PostRepository postRepository;

  CreatePostsBloc(this.postRepository) : super(CreatePostState()) {
    on<CreatePost>(_onCreatePost);
  }

  void _onCreatePost(CreatePost event, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(status: CreatePostStatus.loading));
    try {
      await postRepository.addPost(event.post);
      emit(state.copyWith(
        status: CreatePostStatus.success,
        posts: List.from(state.posts)..add(event.post),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CreatePostStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
