import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 137, 245),
        title: const Text("log in"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyA5_A7mg8hRdLufkX_HqIqvTiil2l4J2xE",
              appId: '1:285368947648:android:39921c7eb812ea97852e25',
              messagingSenderId: '285368947648',
              projectId: 'flutter-app-4141c'),
        ),
        builder: (context, snapshot) {
          return Column(
            children: [
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: const InputDecoration(hintText: "enter your email"),
              ),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                controller: _password,
                decoration:
                    const InputDecoration(hintText: "enter your password"),
              ),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    print(userCredential);
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                  }
                },
                child: const Text("login"),
              ),
            ],
          );
        },
      ),
    );
  }
}
