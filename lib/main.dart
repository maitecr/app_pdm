// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(home: MainScreen(),
/*      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
      },*/
    );
  }
}


class MainScreenState extends State<MainScreen> {
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
              'assets/jiji.jpg'
              ),
            ),
      );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => MainScreenState();
}


class Page02 extends StatefulWidget {
  String email;
  String password;

  Page02({required this.email, required this.password});

  @override
  State<Page02> createState() => Page02State();
}

class Page02State extends State<Page02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Login'),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(widget.email),
            Text(widget.password)
          ],
        ),
      ),
    );
  }
}


class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Center( 
        child: Column(
          children: <Widget>[
            FormLogin(),
          ] 
        ),
        
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  void SaveData() {

    String email = txtemail.text;
    String password = txtpassword.text;

    print(email);
    print(password);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Page02(email: email, password: password)));
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: txtemail,
            decoration: const InputDecoration(
              hintText: 'Digite seu e-mail',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo não pode ser deixado em branco';
              }
            },
          ),

          TextFormField(
            obscureText: true,
            controller: txtpassword,
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
                return ' Senha deve uma letra maiúscula,\numa letra minúscula e um caractere especial';
              }
            },
          ),

          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                Navigator.push(context,  MaterialPageRoute(builder: ((context) => Page02(email: txtemail.text, password: txtpassword.text,))));
              }
            }, 
            child: Text('Logar')),
        ],
      ),
    );

     
  }
}

class FormLogin extends StatefulWidget {
  @override
  State<FormLogin> createState() => _FormLoginState();
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