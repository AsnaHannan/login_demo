import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_firstapp/authentication.dart';
import 'package:vs_firstapp/controllers/user_controller.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/views/user_profile.dart';
import 'package:vs_firstapp/widgets.dart';

class UsersList extends StatefulWidget {
  const UsersList({ Key? key }) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final UserController userController = Get.put(UserController());
  
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
             leading: Center(
             child: ClipOval(
                child: AuthenticationHelper().user.photoURL==null ?   
                       Image.asset('assets/img/dummyUser.png') :
                       Image.network(AuthenticationHelper().user.photoURL.toString(),),
              ),
            ),
            title: Text("Hello, " +AuthenticationHelper().user.email.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomTheme.black),),
            
            ),
            body: Column(
              children: [
              Expanded(
                  child: GetX<UserController>(
                  builder: (controller) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.userList.length,
                    itemBuilder:(context,index){
                    final user = controller.userList[index];
                    return Card(
                      color: CustomTheme.grey50,
                      elevation: 10,
                      shadowColor: CustomTheme.black,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child:ListTile(
                        onTap :(){
                          Get.to(() => const UserProfile(), arguments: { 'userIndex': index });
                        },
                        title:  Text(user.name,style: const TextStyle(fontSize: 22),),
                        subtitle: Text(user.username,style: const TextStyle(fontSize: 16),),
                      ),
                    );
                  });
                  }
                  ),
              )
          ],
          ),
        ),
      ],
    );
  }
}