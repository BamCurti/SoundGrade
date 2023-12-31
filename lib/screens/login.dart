import 'package:flutter/material.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/title.dart';
import 'package:soundgrade/screens/feed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        //title: _isLoginForm ? const Text('Login') : const Text('Sign Up'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: SoundGradeTitle(),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    SizedBox(
                        height:
                            20), // Add space between Username and Password fields
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 90),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB0DCEC),
                          minimumSize: Size(double.infinity, 60)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      child: _isLoginForm
                          ? const Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                          : const Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // Toggle between login and sign-up forms
                          _isLoginForm = !_isLoginForm;
                        });
                      },
                      child: _isLoginForm
                          ? const Text('Switch to Sign Up',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))
                          : const Text('Switch to Login',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
