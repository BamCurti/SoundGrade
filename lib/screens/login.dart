import 'package:flutter/material.dart';
import 'package:soundgrade/widgets/title.dart';
import 'package:soundgrade/screens/feed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginForm = true; // Initially, show the login form.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isLoginForm ? const Text('Login') : const Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: SoundGradeTitle(),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_isLoginForm)
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        return null;
                      },
                    ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MainPage()));
                    },
                    child: _isLoginForm
                        ? const Text('Login')
                        : const Text('Sign Up'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // Toggle between login and sign-up forms
                        _isLoginForm = !_isLoginForm;
                      });
                    },
                    child: _isLoginForm
                        ? const Text('Switch to Sign Up')
                        : const Text('Switch to Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
