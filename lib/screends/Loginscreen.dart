import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 500,
          width: 500,
          child: Column(
            children: <Widget>[
              Container(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              )),
              Container(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              )),
              Visibility(
                child: FlatButton(
                  height: 45,
                  color: Colors.red,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: ()  async{
                    auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                    });
                    
                  },
                ),
              ),
              Visibility(
                child: FlatButton(
                  height: 45,
                  color: Colors.red,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: ()  async{
                    auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                    });
                    
                  },
                ),
              ),
            ],
          )),
    );
  }
}
