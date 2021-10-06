import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is valid Email: $_email, password: $_password');
    } else {
      print('Form is invalid Email: $_email, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset : false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      child: new Container(
        padding: EdgeInsets.all(16),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new SizedBox.fromSize(
                child: Image.asset('assets/blurmindlogo.png')
              ),
              new TextFormField(
                decoration: new InputDecoration(border: OutlineInputBorder(),labelText: 'ID를 입력하세요'),
                validator: (value) =>
                value.isEmpty ? 'ID를 입력하지 않았습니다' : null,
                onSaved: (value) => _email = value,
              ),
              new TextFormField(
                obscureText: true,
                decoration: new InputDecoration(border: OutlineInputBorder(), labelText: '비밀번호를 입력하세요'),
               validator: (value) =>
                value.isEmpty ? '비밀번호를 입력하지 않았습니다' : null,
                onSaved: (value) => _password = value,
              ),
              new RaisedButton(
                color: Colors.lightGreen,
                child: new Text(
                  'SIGN UP',
                  style: new TextStyle(fontSize: 20.0),
                ),
                onPressed: validateAndSave,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

