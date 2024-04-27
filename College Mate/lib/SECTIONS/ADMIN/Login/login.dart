import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:college_mate/SECTIONS/ADMIN/Login/signup.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Admin Login')),
      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           controller: _emailController,
      //           decoration: InputDecoration(labelText: 'Email'),
      //           keyboardType: TextInputType.emailAddress,
      //           validator: (value) => value!.isEmpty ? 'Email is required' : null,
      //         ),
      //         TextFormField(
      //           controller: _passwordController,
      //           decoration: InputDecoration(labelText: 'Password'),
      //           obscureText: true,
      //           validator: (value) => value!.isEmpty ? 'Password is required' : null,
      //         ),
      //         ElevatedButton(
      //           onPressed: () => _login(),
      //           child: Text('Login'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth.signInWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim(),
  //       );
  //
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Login failed: $e')),
  //       );
  //     }
  //   }
  // }
}
