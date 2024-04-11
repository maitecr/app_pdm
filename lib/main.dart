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
              child: const Column(
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