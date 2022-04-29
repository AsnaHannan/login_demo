import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vs_firstapp/authentication.dart';
import 'package:vs_firstapp/views/sign_in_page.dart';
import 'package:vs_firstapp/views/users_list.dart';


TextEditingController signInEmailController = TextEditingController();
TextEditingController signInPasswordController = TextEditingController();

TextEditingController signupEmailController = TextEditingController();
TextEditingController signupPasswordController = TextEditingController();
TextEditingController signupNameController = TextEditingController();
TextEditingController signupConfirmPasswordController = TextEditingController();


final GoogleSignIn googleSignIn = GoogleSignIn();
GoogleSignInAccount? googleSignInAccount;

final FirebaseAuth auth = FirebaseAuth.instance;

late User _user;

void signInUser(BuildContext context) {
  AuthenticationHelper().signIn(email: signInEmailController.text, password: signInPasswordController.text).then((result) {
    if (result == null) {
      print(AuthenticationHelper().user);
      Get.to(() => const UsersList());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          result,
          style: const TextStyle(fontSize: 16),
        ),
      ));
    }
  });
}

void signUpUser(BuildContext context) {
  AuthenticationHelper().signUp(email: signupEmailController.text, password: signupPasswordController.text).then((result) {
    if (result == null) {
     Get.to(() => const SignInPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          result,
          style: const TextStyle(fontSize: 16),
        ),
      ));
    }
  });
}


Future<User?> signInWithGoogle() async {
  googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  UserCredential userCredential = await auth.signInWithCredential(credential);
  _user = userCredential.user!;
  assert(!_user.isAnonymous);
  assert(await _user.getIdToken() != null);
  User currentUser = auth.currentUser!;
  assert(_user.uid == currentUser.uid);
  print("User Name: ${_user.displayName}");
  print("User Email ${_user.email}");
  print(userCredential);
}

void signOutWithGoogle() async{
  googleSignIn.signOut();
  print("User Sign Out");
}