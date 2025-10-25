
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServces{
Future<UserCredential>registerUser(String name ,String email ,String password)async{
var userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(

    email: email,
    password: password
 );
await userData.user?.updateDisplayName(name);
return userData;

}
Future<UserCredential>login(String email ,String password)async {
 var credenttial = await FirebaseAuth.instance.signInWithEmailAndPassword(

     email: email,
     password: password
 );
 return credenttial;
}
bool isLoggedIn() {
 var user = FirebaseAuth.instance.currentUser;
return user != null;
}
Future<void>resetPassword(String email)async{
await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
User? getUserData(){
return FirebaseAuth.instance.currentUser!;
}
Future<void>logout()async{
await FirebaseAuth.instance.signOut();
}

}

