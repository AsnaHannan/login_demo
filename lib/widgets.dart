import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vs_firstapp/authentication.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/global.dart';
import 'package:vs_firstapp/models/user_model.dart';
import 'package:vs_firstapp/views/home_page.dart';
import 'package:vs_firstapp/views/user_map_address.dart';
import 'package:vs_firstapp/views/users_list.dart';


Widget backgroundWidget(BuildContext context) => Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
        colors: <Color>[
          CustomTheme.loginGradientStart,
          CustomTheme.loginGradientEnd
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: <double>[0.0, 1.0],
        tileMode: TileMode.clamp),
  ),
);


Widget lottieImageWidget() => Lottie.asset(
  'assets/68312-login.json',
   width: 400,
   height: 400,
   fit: BoxFit.fill,
);


Widget googleWidget() => InkWell(
    onTap: () {
      signInWithGoogle().then((User? user) {
        signInEmailController.clear();
        signInPasswordController.clear();
        Get.to(() => const UsersList());
      }
      ).catchError((e) => print(e));
    },
    child: Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(
        FontAwesomeIcons.google,
        color: Colors.white,
      ),
    ),
);


Widget horizontalLineWidget() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Colors.white10,
                Colors.white,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: <double>[0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        width: 100.0,
        height: 1.0,
      ),
        const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child:  Text('Or', style: TextStyle(color: CustomTheme.white,fontSize: 16,
              fontWeight: FontWeight.w600),),
      ),
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
                Colors.white,
                Colors.white10,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: <double>[0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        width: 100.0,
        height: 1.0,
      ),
    ],
);


Widget contactsWidget(UserModel user) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      IconButton(
        iconSize: 40,
          splashColor: CustomTheme.loginGradientEnd,
          icon: const Icon(EvaIcons.email),
          onPressed: () async {
          String emailId = user.email.toString();
           final Uri launchUri = Uri(
              scheme: 'mailto',
              path: emailId,
            );
            await launchUrl(launchUri);
          }
      ),
      const VerticalDivider(),
      IconButton(
          iconSize: 40,
          splashColor: CustomTheme.loginGradientEnd,
          icon: const Icon(EvaIcons.phoneCall),
          onPressed: () async {
            String phoneNumber = user.phone.toString();
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: phoneNumber,
            );
            await launchUrl(launchUri);
          }
      ),
      const VerticalDivider(),
      IconButton(
          iconSize: 40,
          splashColor: CustomTheme.loginGradientEnd,
          icon: const Icon(EvaIcons.browser),
          onPressed: () async {
            String website = user.website.toString();
            final Uri launchUri = Uri(
              scheme: 'https',
              path: website,
            );
            await launchUrl(launchUri);
          }
      ),
      const VerticalDivider(),
      IconButton(
          iconSize: 40,
          splashColor: CustomTheme.loginGradientEnd,
          icon: const Icon(EvaIcons.map),
          onPressed: () {
            Get.to(const UserMapAddress(), arguments: { 'user': user });
          }
      ),
    ],
  );


IconButton signOutWidget(BuildContext context) => IconButton(
    iconSize: 40,
    color: CustomTheme.black,
    splashColor:  CustomTheme.loginGradientEnd,
    icon: const Icon(
      FontAwesomeIcons.arrowRightFromBracket,
      color: CustomTheme.black,
    ),
    onPressed: () {
      AuthenticationHelper().signOut();
      signOutWithGoogle();
      ScaffoldMessenger.of(context).showSnackBar(snackBarWidget());
      Get.to(() => const HomePage());
    }
);

SnackBar snackBarWidget() => SnackBar(content: Text("Sign out", 
    textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
    backgroundColor: CustomTheme.black38,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
    elevation: 6.0,
);
