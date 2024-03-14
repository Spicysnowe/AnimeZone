import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/presentation/views/auth/cutom_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:anime_zone/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus || passwordFocusNode.hasFocus) {
        if (!isTextFieldFocused) {
          setState(() {
            isTextFieldFocused = true;
          });
        }
      } else {
        if (isTextFieldFocused) {
          setState(() {
            isTextFieldFocused = false;
          });
        }
      }
    });

    passwordFocusNode.addListener(() {
      if (emailFocusNode.hasFocus || passwordFocusNode.hasFocus) {
        if (!isTextFieldFocused) {
          setState(() {
            isTextFieldFocused = true;
          });
        }
      } else {
        if (isTextFieldFocused) {
          setState(() {
            isTextFieldFocused = false;
          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        backgroundColor: black1,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(24, context),
                vertical: scaleHeight(24, context)),
            child: Container(
              height: scaleHeight(570, context),
              width: double.infinity,
              child: Column(
                mainAxisAlignment:!isTextFieldFocused? MainAxisAlignment.spaceBetween: MainAxisAlignment.start,
                children: [
                 SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: scaleWidth(50, context),
                        width: scaleWidth(50, context),
                        decoration: BoxDecoration(
                            color: purple, borderRadius: BorderRadius.circular(50)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: scaleHeight(24, context),
                        ),
                        child: Text(
                          "Login to your Account",
                          style: GoogleFonts.getFont(fontFamily1,
                              color: Colors.white,
                              fontSize: scaleHeight(16, context)),
                        ),
                      ),
                        
                      DetailsTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Enter your email',
                        focusNode: emailFocusNode,
                        maxLength: 30,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          bool emailValid =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value);
                        
                          if (!emailValid) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                        
                        
                      SizedBox(
                        height: scaleHeight(16, context),
                      ),
                        
                      DetailsTextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Enter your password',
                        maxLength: 30,
                        validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                        onSaved: (value) {},
                      ),
                        
                      SizedBox(
                        height: scaleHeight(24, context),
                      ),
                        
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     vertical: scaleHeight(4, context),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Checkbox(
                      //         value: _isChecked,
                      //         onChanged: (bool? newValue) {
                      //           setState(() {
                      //             _isChecked = newValue!;
                      //           });
                      //         },
                      //       ),
                      //       Text(
                      //         "Remember Me",
                      //         style: GoogleFonts.getFont(fontFamily1,
                      //             color: Colors.white,
                      //             fontSize: scaleHeight(8, context)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                        
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: scaleHeight(40, context),
                          margin: EdgeInsets.only(bottom: scaleHeight(8, context)),
                          decoration: const BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.getFont(fontFamily1,
                                  fontSize: scaleHeight(12, context),
                                  fontWeight: FontWeight.w400,
                                  height: 1.25,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(fontFamily1,
                          color: Colors.white, fontSize: scaleHeight(10, context)),
                      children: <TextSpan>[
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'SignUp',
                          style: GoogleFonts.getFont(fontFamily1,
                              color: Colors.purple,
                              fontSize: scaleHeight(10, context)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/signup', 
                                (Route<dynamic> route) =>
                                    false, 
                              );
                              
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

}
