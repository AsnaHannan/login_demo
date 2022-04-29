import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/global.dart';
import 'package:vs_firstapp/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextPassword = true;

@override
  void dispose() {
    super.dispose();
  }

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
            child: Form(
            key: _formKey,
            child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    const Text ("Sign In", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 30,),
                    const Text("Login with your credentials",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                       child: TextFormField(
                         controller: signInEmailController,
                        style:  TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16.0,
                            color: CustomTheme.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.envelope,
                            color: CustomTheme.black,
                            size: 22.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color:CustomTheme.black38,
                                style: BorderStyle.solid,
                                width: 1,
                              )
                          ),
                          hintText: 'Email Address',
                          hintStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 17.0),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Email Address cannot be empty";
                          }
                          return null;
                        },
                    ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                       child: TextFormField(
                         controller: signInPasswordController,
                         obscureText: _obscureTextPassword,
                        style:  TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16.0,
                            color: CustomTheme.black),
                        decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FontAwesomeIcons.lock,
                          size: 22.0,
                          color: CustomTheme.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                              color:CustomTheme.black38,
                              style: BorderStyle.solid,
                              width: 1,
                            )
                        ),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 17.0),
                          suffixIcon: InkWell(
                            onTap: _showPassword,
                            child: Icon(
                              _obscureTextPassword
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15.0,
                              color: CustomTheme.black,
                            ),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          return null;
                        },
                    ),
                     ),

                    const SizedBox(height: 30,),
                    MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                            signInUser(context);
                            signInEmailController.clear();
                            signInPasswordController.clear();
                        }
                      },
                      color: CustomTheme.black38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: const Text("Login",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 16,color: CustomTheme.white),),    
                    ),	
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: horizontalLineWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: googleWidget(),
                    ),
                ],
              ),
            ]
          )
        )
          )
          ),
        ),
      ],
    );
  }

  void _showPassword() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

}