import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_firstapp/authentication.dart';
import 'package:vs_firstapp/controllers/user_controller.dart';
import 'package:vs_firstapp/widgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({ Key? key }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

   var userIndex = Get.arguments['userIndex'];
   final user = Get.find<UserController>();
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(context),
        Scaffold(
          backgroundColor: const Color(0x00000000),
          appBar: AppBar(
            automaticallyImplyLeading: false, 
            backgroundColor: const Color(0x00000000),
            elevation: 0.0,
            actions: <Widget>[
              signOutWidget(context),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 0.0, left: 0.0, right: 0.0),
                  child: Center(
                    child: ClipOval(
                      child:
                        AuthenticationHelper().user.photoURL==null ?  
                        Image.asset('assets/img/dummyUser.png', width: 150, height: 150, fit: BoxFit.cover,) :
                        Image.network(AuthenticationHelper().user.photoURL.toString(), width: 150, height: 150, fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    user.userList[userIndex].name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 40),
                contactsWidget(user.userList[userIndex]),
            ],
            )
          ),
      ],
    );
  }
}