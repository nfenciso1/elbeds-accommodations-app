import 'package:flutter/material.dart';
import 'package:stals_frontend/screens/verify_user.dart';
import '../models/signup_arguments.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String _firstName = '';
  String _lastName = '';
  String _middleName = '';
  String? _suffix = '';
  String _username = '';
  String _password = '';
  String _email = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    Map<String,String> args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: height * 0.04),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
              onChanged: (value) => _firstName = value,
              controller: firstNameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
              onChanged: (value) => _lastName = value,
              controller: lastNameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Middle Name',
              ),
              onChanged: (value) => _middleName = value,
              controller: middleNameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Suffix',
              ),
              onChanged: (value) => _suffix = value,
              controller: suffixController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value) => _username = value,
              controller: usernameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) => _password = value,
              controller: passwordController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) => _email = value,
              controller: emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) => _phone = value,
              controller: phoneController,
            ),
            MaterialButton(
              child: const Text('Next'),
              onPressed: () {
                Navigator.pushNamed(context, '/verify_user',
                arguments: SignupArguments(_firstName, _lastName, _middleName, _suffix, _username, _password, _email, _phone, args['type']));
              },
            ),
          ],
        ),
      ),
    );
  }
}
