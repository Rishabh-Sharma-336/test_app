import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Components/mytextfield.dart';
import '../Components/myButton.dart';
import '../Components/squareTile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {

    //Loading Circle
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      //Popping the Circle
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {

      //Popping the Circle
      Navigator.pop(context);
      print(e.code);
      if(e.code == 'user-not-found'){
        wrongEmailMessage();
      }
      else if(e.code == 'wrong-password'){
        wrongPasswordMessage();
      }
    }
  }

  //Wrong Email Message
  void wrongEmailMessage(){
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        title: Text(
          'Incorrect Email',
        ),
      );
    },
    );
  }

  //Wrong Password Message
  void wrongPasswordMessage(){
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        title: Text(
          'Incorrect Password',
        ),
      );
    },
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      body: SafeArea(child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 50.0,
            height: 50,),

            //logo

            const Icon(Icons.lock,
            size: 50.0,
            ),
            const SizedBox(height: 50,),
            const Text(
              'Hi There!',
              style: TextStyle(color: Colors.black,
                  fontSize: 18 ),
              ),
            const SizedBox(height: 50.0,),

            //Text Field

            myTextField(
              controller: emailController,
              hintText: 'Email id',
              obscureText: false,
            ),
            const SizedBox(height: 25.0,),
            myTextField(
              controller: passwordController,
              hintText: 'Enter Your Password',
              obscureText: true,
            ),
            const SizedBox(height: 10,),

            //Forgot password

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 25,),

            //SignIn Button

            MyButton(
              onTap: signUserIn,
            ),
            const SizedBox(height: 20,),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                      'Or To Continue With',
                    style: TextStyle(color: Colors.grey),

                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 50,),

          //Images

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imageurl: 'lib/Images/google.png', height: 40),
                SizedBox(width: 10,),
                SquareTile(imageurl: 'lib/Images/apple.png', height: 40),


              ],
            ),
          ),
            const SizedBox(height: 25,),

            //Register Now

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                SizedBox(width: 10,),
                Text('Register Now.',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ],

        ),
      )
      ),
    );
  }
}
