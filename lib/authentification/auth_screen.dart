import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts/posts.dart';
import 'Auth_bloc/auth_bloc.dart';
import 'Auth_bloc/auth_event.dart';
import 'Auth_bloc/auth_state.dart';


class AuthScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Authentification')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
  if (state.status == AuthStatus.success) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in as ${state.user!.email}')));
    // Redirect to AllPostsScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AllPostsScreen()),
    );
  } else if (state.status == AuthStatus.error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage ?? 'Authentication Error')));
  }
},
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            return const  Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const  InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration:const  InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                 const  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      context.read<AuthBloc>().add(SignInRequested(email, password));
                    },
                    child: const  Text('Sign In'),
                  ),

                ],
              ),
            );
          }
        },
      ),
    );
  }
}
