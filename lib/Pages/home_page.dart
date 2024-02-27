import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;
  void SignUserOut() async {
    FirebaseAuth.instance.signOut();
  }
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Logged In as: ' + user.email!,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
