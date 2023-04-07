import 'package:flutter/material.dart';
import 'package:calisma_destek_01/screens/login_screen.dart';
import 'package:calisma_destek_01/screens/home_screen.dart';
import 'package:calisma_destek_01/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Varsayılan olarak, Flutter uygulamalarında debug modda çalışırken ekranın üst tarafında "Debug" yazısı yer alır. Bu özellik bu yazının gösterilip gösterilmeyeceğini belirler.
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}