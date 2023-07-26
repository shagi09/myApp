import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 100, 22, 235)),
        useMaterial3: true,
      ),
      home: const homePage(),
    ),
  );
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        backgroundColor: Color.fromARGB(255, 73, 202, 231),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyA5_A7mg8hRdLufkX_HqIqvTiil2l4J2xE",
              appId: '1:285368947648:android:39921c7eb812ea97852e25',
              messagingSenderId: '285368947648',
              projectId: 'flutter-app-4141c'),
        ),
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              print(user);
              return const Text('done');
            default:
              return const Text('loading');
          }
        },
      ),
    );
  }
}
