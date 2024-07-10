import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viral_post/create_poste/create_post_blloc/create_post_bloc.dart';
import 'package:viral_post/create_poste/create_post_blloc/create_post_event.dart';
import 'package:viral_post/post_detail/post_detail_bloc/post_detail_bloc.dart';
import 'package:viral_post/posts/all_post_bloc/all_posts_bloc.dart';
import 'package:viral_post/posts/post_repository.dart';
import 'package:viral_post/posts/posts.dart';
import 'authentification/Auth_bloc/auth_bloc.dart';
import 'authentification/auth_repository.dart';
import 'authentification/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository),
        ),
        BlocProvider<AllPostsBloc>(
          create:  (context) => AllPostsBloc(PostRepository()),
        ),
        BlocProvider<CreatePostsBloc>(
          create:  (context) => CreatePostsBloc(PostRepository()),
        ),
        BlocProvider<PostDetailBloc>(
        create: (context) => PostDetailBloc(postRepository: PostRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        debugShowCheckedModeBanner: false,
        home: AllPostsScreen(),
      ),
    );
  }
}
