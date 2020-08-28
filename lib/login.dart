import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nogozo/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginpage(),
    );
  }
}


class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

enum FormType { login, register }

class _loginpageState extends State<loginpage> {
  @override
  GlobalKey<FormState> Fkey = new GlobalKey<FormState>();
  FormType Ftype = FormType.login;
  String _email = "";
  String _password = "";

  void toregister() {
    Fkey.currentState.reset();

    setState(() {
      Ftype = FormType.register;
    });
  }

  void tologin() {
    Fkey.currentState.reset();

    setState(() {
      Ftype = FormType.login;
    });
  }


//  bool validateandsave() {
//    final form = Fkey.currentState;
//    if(form.validate()){
//      form.save();
//      return true;
//    }
//    else{
//      return false;
//    }
//  }
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black87,
          appBar: AppBar(
            //title: Text('LOGIN'),
            backgroundColor: Colors.transparent,
//            leading: IconButton(
//                icon: Icon(Icons.arrow_back_ios), onPressed: () {  AlertDialog(
//              title: Text('Very, very large title', textScaleFactor: 5),
//              content: Text('Very, very large content', textScaleFactor: 5),
//              actions: <Widget>[
//                FlatButton(child: Text('Button 1'), onPressed: () {}),
//              ],
//            );}),
          ),
          body: Form(
            key: Fkey,
            child: Column(
                children: Fields() + Buttons()
            ),
          )
    );
  }

  List<Widget> Fields() {
    return [
//      SizedBox(
//        height: 50,
//      ),
      Expanded(
        child: Image(
          image: AssetImage('assets/nogozo.jpg'),
        ),
        flex: 2,
      ),

      Expanded(
        child: TextFormField(

          decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: 'YOUR EMAIL',
          ),
          validator: (value) {
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value) {
            return _email = value;
          },
        ),
      ),
      Expanded(
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: 'YOUR PASSWORD',
          ),
          validator: (value) {
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value) {
            return _password = value;
          },
        ),
      ),
    ];
  }

  List<Widget> Buttons() {
    if (Ftype == FormType.login) {
      return [
        RaisedButton(
          child: Text('LOGIN',
          style: TextStyle(
            color: Colors.white
          ),),
          color: Colors.red,
          onPressed: () {
            SignIn();
          },
        ),
        FlatButton(
          child: Text('New User? Create an account.',
            style: TextStyle(
                color: Colors.grey
            ),),
          onPressed: () {
            toregister();
          },

        )
      ];
    }
    else {
      return [
        RaisedButton(
          child: Text('SIGNUP',
          style: TextStyle(
            color: Colors.white
          ),),
          color: Colors.red,
          onPressed: () {
            SignUp();
          },
        ),
        FlatButton(
          child: Text('Already a User? Login.',
            style: TextStyle(
                color: Colors.grey
            ),),
          onPressed: () {
            tologin();
          },

        )
      ];
    }
  }

  Future<void> SignIn() async {
    final formState = Fkey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print('Im in');
        Navig();
      }
      catch (e) {
        print(e.message);
      }
    }
  }

  void Navig() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  Future<void> SignUp() async {
    final formState = Fkey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        print('Im in');
        Navig();
      }
      catch (e) {
        print(e.message);
      }
    }
  }
}
