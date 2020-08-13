import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Services/data.dart';
import 'package:flutterapp/Services/user.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
    
  }
  
  // auth stream change
Stream<User> get user{
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser);
}
  // sign in with email & password

  Future signinwithemailandpwd(String Email, String Mot_de_Passe) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: Email, password: Mot_de_Passe);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);


    } catch(e){
      print(e.toString());
      return null;
    }
  }


  // register with email & password
  
  Future registerwithnumberandemailandpwd(String Numero_de_Telephone, String Email, String Mot_de_Passe) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: Email, password: Mot_de_Passe);
    FirebaseUser user = result.user;
    
    //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('Enter Pickup', 'Enter Dropoff', 'Select Number_of_Seats');
    return _userFromFirebaseUser(user);
         
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  
  
  // sign out
Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
}

}