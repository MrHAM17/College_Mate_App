import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:college_mate/SECTIONS/ADMIN/Login/login.dart';

class AdminSignupScreen extends StatefulWidget {
  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // String _selectedRole = 'All';
  // String _selectedBranch = 'AIDS';
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Admin Signup')),
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
      //           validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters long' : null,
      //         ),
      //         DropdownButtonFormField(
      //           value: _selectedRole,
      //           items: ['All', 'ATRANG', 'Events', 'Fests', 'NSS', 'REVIVE', 'RESONANCE']
      //               .map((role) => DropdownMenuItem(value: role, child: Text(role)))
      //               .toList(),
      //           onChanged: (value) => setState(() => _selectedRole = value!),
      //           decoration: InputDecoration(labelText: 'Role'),
      //         ),
      //         DropdownButtonFormField(
      //           value: _selectedBranch,
      //           items: ['AIDS', 'Civil', 'Computer', 'EXTC', 'IT', 'Mechanic', 'Mechatronics']
      //               .map((branch) => DropdownMenuItem(value: branch, child: Text(branch)))
      //               .toList(),
      //           onChanged: (value) => setState(() => _selectedBranch = value!),
      //           decoration: InputDecoration(labelText: 'Branch'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () => _signup(),
      //           child: Text('Signup'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // Future<void> _signup() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim(),
  //       );
  //
  //       await _firestore.collection('admins').doc(userCredential.user?.uid).set({
  //         'email': _emailController.text.trim(),
  //         'role': _selectedRole,
  //         'branch': _selectedBranch,
  //       });
  //
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Signup failed: $e')),
  //       );
  //     }
  //   }
  // }
}
