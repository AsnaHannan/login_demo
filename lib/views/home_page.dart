import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/views/sign_in_page.dart';
import 'package:vs_firstapp/views/sign_up_page.dart';
import 'package:vs_firstapp/widgets.dart';

class HomePage extends StatefulWidget {
   const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  lottieImageWidget(),
                  const SizedBox(height: 60,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height:60,
                    onPressed: (){ 
                        Get.to(() => const SignInPage());
                    },
                    color: CustomTheme.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Text("Sign In",style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,color: CustomTheme.white
                    ),)
                  ),
                  const SizedBox(height: 30,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height:60,
                    onPressed: (){
                      Get.to(() => const SignUpPage());
                    },
                    color: CustomTheme.black38,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Text("Sign UP",style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,color: CustomTheme.white
                    ),),
                  ),	
                ],
              ),
            ]
          )
        ))
         ),
      ],
    );
  }
}