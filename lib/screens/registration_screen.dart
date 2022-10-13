import 'package:chatiat/constants.dart';
import 'package:chatiat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../compoenes/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: KPrimeryColor,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        KInputDecoration.copyWith(hintText: 'Enter your Email'),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: KInputDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundButton(
                    buttonText: 'Create an Account',
                    color: KSeconderyColor,
                    onClick: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final new_user =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        setState(() {
                          isLoading = false;
                        });
                        if (new_user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
