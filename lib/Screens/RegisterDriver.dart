//import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'RegisterCar.dart';


class Registerdriver extends StatefulWidget{
  @override
  _Registerdriver createState() => _Registerdriver();
}

class _Registerdriver extends State<Registerdriver> {
  String NOM, Prenom;
  String Numero_de_Telephone;
  String Email;
  String Date_de_Naissance;
  String Mot_de_Passe;
  String Confirmez_le_mot_de_Passe;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50.0,),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity),
                        labelText: 'Numero de Telephone',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        )
                    ),
                    onChanged: (value) {
                      Prenom = value;
                    }
                )

            ),

            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Date de Naissance',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),
//                  onChanged: (value){
                  //                  Date_de_Naissance = value;
                  //              } ,
                )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Gender',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),
                  onChanged: (value){
                    Email = value;
                  } ,
                )
            ),
            SizedBox(height: 25.0,),
            Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green,
                elevation: 7.0,
                child: GestureDetector(
                 onTap: (){
//                    Navigator.push(context, MaterialPageRoute(
//                        builder: ((context) => RegCar())
                  //  ));

                  },
                  child: Center(
                      child : Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      )
                  ),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
