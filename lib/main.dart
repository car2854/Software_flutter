import 'package:flutter/material.dart';
import 'package:proyecto_software/src/export/routes.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {

        'login'       : ( BuildContext context ) => LoginPage(),
        'camera'      : ( BuildContext context ) => CameraPage(),

      },
    );
  }
}