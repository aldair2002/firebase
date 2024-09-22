import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFunc extends StatelessWidget {
  final bool loggedIn;
  final VoidCallback signOut;

  const AuthFunc({required this.loggedIn, required this.signOut, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loggedIn
        ? Column(
            children: [
              const Text('Welcome back!'),
              ElevatedButton(
                onPressed: signOut,
                child: const Text('Sign Out'),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: () async {
              // Aquí puedes implementar el inicio de sesión
              // Por ejemplo, usando FirebaseAuth
              try {
                final email = 'tu_email@example.com'; // Reemplaza con tu lógica
                final password = 'tu_contraseña'; // Reemplaza con tu lógica
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
              } catch (e) {
                // Manejo de errores
                print(e);
              }
            },
            child: const Text('Sign In'),
          );
  }
}
