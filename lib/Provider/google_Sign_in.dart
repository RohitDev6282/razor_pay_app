// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';



// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn =  GoogleSignIn();
//   late bool _isSigningIn; 

//   GoogleSignInProvider(){
//     _isSigningIn = false;
//   }

//   bool get isSignIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn){
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }


// Future login() async{
//   isSigningIn = true;

//   final user = await googleSignIn.signIn();
//   if(user == null){
//     return;
//   }else {
//     final googleAuth =  await user.authentication;
//     final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,);
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     isSigningIn =  false ; 
//   }
// }
// Future<void> Logout() async {
//   await googleSignIn.disconnect();
//   FirebaseAuth.instance.signOut();
// }
// }