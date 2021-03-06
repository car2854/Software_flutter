// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_software/src/styles/styles.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final styles = Styles();

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    _Datos(title: styles.nameApp),
                    
                    _Button(mensaje: 'Dont have an account?', buttonName: 'Log In')
                  ],
                ),
              )
            ],
            
          ),
        ),
      ),
      
    );
  }
}

class _Button extends StatelessWidget {

  
  final String mensaje, buttonName;
  const _Button({
    @required this.mensaje, 
    @required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {

    final styles = Styles();

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(60),
        child: Column(
          children: [

            Spacer(),

            GestureDetector(
              onTap: () { Navigator.pushReplacementNamed(context, 'camera'); },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: styles.color
                ),
                child: Center(
                  child: Text(
                    this.buttonName,
                    style: TextStyle(
                      color: styles.styleColorTheme,
                      fontSize: 15
                    ),  
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {print('Contraseña olvidada');},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(this.mensaje),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Datos extends StatelessWidget {

  final String title;

  const _Datos({
    @required this.title
  });

  @override
  Widget build(BuildContext context) {

    final screen = MediaQuery.of(context).size;
    final styles = Styles();

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screen.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: 70),
        decoration: BoxDecoration(
          color: styles.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          child: Column(
            children: [

              _title(this.title),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                  children: [

                    _InputText(
                      description: 'Nombre de Usuario',
                    ),
    
                    _InputText(
                      description: 'Contraseña', 
                      password: true,
                    ),
    
                  ],
                )
              )



            ],
          ),
        ),
      ),
    ); 
    
  }

  Container _title( String title ) {

    final styles = Styles();

    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 36,
            color: styles.styleColorTheme
          ),
        )
      ),
    );
  }
}

class _InputText extends StatelessWidget {

  final description;
  final bool password;
  
  const _InputText({
    @required this.description, 
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 10),

      child: TextFormField(
        decoration: InputDecoration(
          labelText: this.description,
          labelStyle: TextStyle(
            color: styles.styleColorTheme,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: styles.styleColorTheme)
          )
        ),
        style: TextStyle(
          color: styles.styleColorTheme
        ),
        

        obscureText: (this.password),

      ),
    );
  }
}
