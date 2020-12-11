// import 'dart:html';
import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_software/src/styles/styles.dart';


class CameraPage extends StatefulWidget {

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  File videoFile;
  File imageFile;

  @override
  Widget build(BuildContext context) {

    final styles = Styles();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Name',
          style: TextStyle(
            color: styles.styleColorTheme
          ),
        ),
        backgroundColor: styles.color,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt), 
            color: styles.styleColorTheme,
            onPressed: () {
              
              _camera();

            }
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: styles.styleColorTheme,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            }
          )
        ],
      ),
      body: Center(
        child: Text('No se que agregar :v')
      ),
   );
  }



  _camera() async {
    File theImage = await ImagePicker.pickVideo(
      source: ImageSource.camera
    );

    if (theImage != null){
      setState(() {
        imageFile = theImage;
      });
    }
  }


}

