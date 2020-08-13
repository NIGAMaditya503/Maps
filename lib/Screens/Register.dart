
import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth.dart';

import 'ChoicePage.dart';

//import 'Registerdriver.dart';


class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  String NOM_et_Prenom = '';
  String Numero_de_Telephone = '';
  String Email = '';
  String DummyEmail= '';
//  String Date_de_Naissance = '';
  String Mot_de_Passe = '';
  //String Confirmez_le_mot_de_Passe = '';
  String error = '';



  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(

        child: Form(
          key: _formKey,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity),
                        labelText: 'NOM et Prenom',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        )
                    ),
                    onChanged: (value) {
                      setState(() => NOM_et_Prenom = value

                      );
                    }
                )

            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextFormField(
                  validator: (value) => value.length < 10 ? 'Enter a valid Number': null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Numero_de_Telephone',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),
                  onChanged: (value){

                    setState(() => Numero_de_Telephone = value

                    );
                      } ,
                )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter a valid Email' : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),

                  onChanged: (value){
                    Text( DummyEmail = value

                    );

                    setState(() => Email = value

                    );
                  } ,
                )
            ),

            Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: TextFormField(
                  validator: (value) => value.length < 6 ? 'Enter a 6 character Password': null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.dialpad),
                      labelText: 'Mot de Passe',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),
                  obscureText: true,
                  onChanged: (value){

                    setState(() => Mot_de_Passe = value

                    );
                  } ,
                )
            ),
            SizedBox(height: 25.0,),
            RaisedButton(
              color: Colors.green,
              elevation: 5.0,
              
              child: Text('Register',
                style: TextStyle(color: Colors.white),
              ),
              
              onPressed: ()async{
                if (_formKey.currentState.validate()){
                  dynamic result = await _auth.registerwithnumberandemailandpwd(Numero_de_Telephone, Email.trim(), Mot_de_Passe);
                  if(result == null){
                    setState(() => error = 'Check your Credentials'

                    );
                  } else{
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Sign up Successful"),
                    ));




                  Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => HomePage1())
                  ));
                }
                  }




              },
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )


          ],
        ),
      ),
      )
    );

  }
}
