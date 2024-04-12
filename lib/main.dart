// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext) {
    return MaterialApp(home: MainScreen());
  }

}
class MainScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/museu.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Maitê'
                    ),
                  Text(
                    'email@email.com'
                  ),
                ],
              ),
            ),

            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),

            ListTile(
              title: Text('Trocar Senha'),
              onTap: () {
                 Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            )

          ]
        ),
      ),

      appBar: AppBar(
        title: Text('Teste título'),
      ),

      body: Center(
        child: Image.asset(
          'assets/jiji.jpg',
          fit: BoxFit.fill),
      ),


    );
  }
}


class FormExample extends StatefulWidget {

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite seu e-mail',
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite sua senha'
            ),
          )

        ],
      ),
    );
  }

}



class ChangePasswordPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trocar Senha'),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
    );
  }
}