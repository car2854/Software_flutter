// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                    Datos(title: 'App Name'),
                    
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(60),
        child: Column(
          children: [

            Spacer(),

            GestureDetector(
              onTap: () { print('login'); },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff343A40)
                ),
                child: Center(
                  child: Text(
                    this.buttonName,
                    style: TextStyle(
                      color: Colors.white,
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

class Datos extends StatelessWidget {

  final String title;

  const Datos({
    @required this.title
  });

  @override
  Widget build(BuildContext context) {

    final screen = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screen.height * 0.7,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: screen.width * 0.9,
          width: screen.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50)
            ),
            color: Color(0xff343A40)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
            child: Column(
              children: [
                
                _title(this.title),


                Expanded(
                  child: Container(
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
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _title( String title ) {

    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 36,
            color: Colors.white
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
    return Container(

      padding: EdgeInsets.symmetric(vertical: 10),

      child: TextFormField(
        decoration: InputDecoration(
          labelText: this.description,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        ),
        style: TextStyle(
          color: Colors.white
        ),
        

        obscureText: (this.password),

      ),
    );
  }
}

