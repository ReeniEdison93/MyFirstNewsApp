
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///C:/Users/Felix%20Fedalies/AndroidStudioProjects/sample_app/lib/ui/Navigation.dart';

import '../bloc/login_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LoginPage extends StatelessWidget {

  login(BuildContext context){

    Navigator.of(context).push(MaterialPageRoute(
        builder:(context)=> MyNavigationBar() ));
  }
    final bloc = MyBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          child: Column(
            children: <Widget>[
              Text(
                'LogIn',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              StreamBuilder<String>(
                stream: bloc.userName,
                builder:(context,snapshot)=> Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: bloc.userNameChanged ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder:(context,snapshot)=> Container(
                  padding: EdgeInsets.fromLTRB(20,0,20,20),
                  child: TextFormField(
                    onChanged: bloc.passwordChanged,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
          StreamBuilder<bool>(
            stream: bloc.submitCheck,
            builder:(context,snapshot)=> Container(
              height: 50,
              //padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Submit') ,
                onPressed:()=> snapshot.hasData?
                    login(context): Scaffold.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Invalid Username or Password'),),),

              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
