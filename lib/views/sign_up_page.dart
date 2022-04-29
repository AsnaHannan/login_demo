import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/global.dart';
import 'package:vs_firstapp/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  
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
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text ("Sign Up", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 30,),
                    const Text("Create an Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                       child: TextFormField(
                         controller: signupNameController,
                        style:  TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16.0,
                            color: CustomTheme.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.person,
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
                          hintText: 'Name',
                          hintStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 17.0),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                    ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                       child: TextFormField(
                         controller: signupEmailController,
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
                        controller: signupPasswordController,
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
                      Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                       child: TextFormField(
                         controller: signupConfirmPasswordController,
                         obscureText: _obscureTextConfirmPassword,
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
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 17.0),
                          suffixIcon: InkWell(
                            onTap: _showConfirmPassword,
                            child: Icon(
                              _obscureTextConfirmPassword
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15.0,
                              color: CustomTheme.black,
                            ),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Confirm Password cannot be empty";
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
                          signUpUser(context);
                          signupNameController.clear();
                          signupEmailController.clear();
                          signupPasswordController.clear();
                          signupConfirmPasswordController.clear();
                        }
                      },
                      color: Colors.black38,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: const Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 16,color: CustomTheme.white
                      ),),
                    ),	
                ],
              ),
            ]
          )
        )
        ),
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

  void _showConfirmPassword() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}