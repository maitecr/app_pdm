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


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormLogin(),
      )
    );
  }
}

class FormLogin extends StatefulWidget {

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser deixado em branco';
              }

              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),

          TextFormField(
//            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Digite sua senha'
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser deixado em branco';
              }

              if (value.length < 6 || value.length > 12) {
                return 'Senha deve conter entre 6 e 12 caracteres';
              }

              if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#$&*])').hasMatch(value)) {
                return 'Senha deve uma letra maiúscula,\n uma letra minúscula e um caractere especial';
              }

              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),

          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print('$_email');
                print('$_password');
              }
            }, 
            child: Text('Logar')),
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

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormChangePassword(),
        ) 
    );
  }
}

class FormChangePassword extends StatefulWidget {

  @override
  State<FormChangePassword> createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informar senha atual',
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite nova senha'
            ),
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Confirmar nova senha'
            ),
          ),

          ElevatedButton(
            onPressed: () {
              
            }, 
            child: Text('Atualizar')),

        ],
      ),
    );
  }
}