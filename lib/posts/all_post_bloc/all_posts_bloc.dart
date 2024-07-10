import 'package:bloc/bloc.dart';
import '../post_repository.dart';
import 'all_posts_event.dart';
import 'all_posts_state.dart';

class AllPostsBloc extends Bloc<AllPostsEvent, AllPostsState> {
  final PostRepository postRepository;

  AllPostsBloc(this.postRepository) : super(AllPostsState()) {
    on<LoadAllPosts>(_onLoadAllPosts);
    on<SelectPost>(_onSelectPost);
  }

  void _onLoadAllPosts(LoadAllPosts event, Emitter<AllPostsState> emit) async {
    emit(state.copyWith(status: AllPostsStatus.loading));
    try {
      final posts = await postRepository.getAllPosts();
      emit(state.copyWith(status: AllPostsStatus.success, posts: posts));
    } catch (e) {
      emit(state.copyWith(status: AllPostsStatus.error, errorMessage: e.toString()));
    }
  }

  void _onSelectPost(SelectPost event, Emitter<AllPostsState> emit) {
    emit(state.copyWith(status: AllPostsStatus.postSelected, selectedPost: event.selectedPost));
  }
}
