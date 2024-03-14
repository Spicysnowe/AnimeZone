import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/presentation/views/auth/cutom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Widget> widgetOptions = [
  const DetailsSet1(),
  const DetailsSet2(),
  const DetailsSet3()
];

class Deatils extends StatefulWidget {
  const Deatils({super.key});

  @override
  State<Deatils> createState() => _DeatilsState();
}

class _DeatilsState extends State<Deatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black1,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(24, context),
                vertical: scaleHeight(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Get to Know You",
                  style: GoogleFonts.getFont(fontFamily1,
                      color: Colors.white, fontSize: scaleHeight(16, context)),
                ),
                SizedBox(
                  height: scaleHeight(8, context),
                ),
                CustomRowContainers(),
                Flexible(
                  child: Center(
                    child: widgetOptions.elementAt(0),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomRowContainers extends StatelessWidget {
  const CustomRowContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(10, context),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Expanded(
            child: CustomContainer(
              color: purple,
            ),
          ),
          SizedBox(width: scaleWidth(4, context)),
          const Expanded(
            child: CustomContainer(color: purple),
          ),
          SizedBox(width: scaleWidth(4, context)),
          const Expanded(
            child: CustomContainer(color: purple),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget? child;

  const CustomContainer({Key? key, required this.color, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }
}

class DetailsSet1 extends StatefulWidget {
  const DetailsSet1({super.key});

  @override
  State<DetailsSet1> createState() => _DetailsSet1State();
}

class _DetailsSet1State extends State<DetailsSet1> {
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode gendereFocusNode = FocusNode();
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus ||
          nameFocusNode.hasFocus ||
          dobFocusNode.hasFocus ||
          gendereFocusNode.hasFocus) {
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

    nameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus ||
          nameFocusNode.hasFocus ||
          dobFocusNode.hasFocus ||
          gendereFocusNode.hasFocus) {
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

    dobFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus ||
          nameFocusNode.hasFocus ||
          dobFocusNode.hasFocus ||
          gendereFocusNode.hasFocus) {
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

    gendereFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus ||
          nameFocusNode.hasFocus ||
          dobFocusNode.hasFocus ||
          gendereFocusNode.hasFocus) {
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(24, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            DetailsTextField(
              controller: userNameController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Enter your username',
              focusNode: usernameFocusNode,
              maxLength: 30,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) {},
            ),


            SizedBox(
              height: scaleHeight(16, context),
            ),

            DetailsTextField(
              controller: nameController,
              focusNode: nameFocusNode,
              keyboardType: TextInputType.text,
              labelText: 'Enter your name',
              maxLength: 30,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {},
            ),

            SizedBox(
              height: scaleHeight(16, context),
            ),

            DetailsTextField(
              controller: dobController,
              focusNode: dobFocusNode,
              keyboardType: TextInputType.datetime,
              labelText: 'Enter your date of birth',
              maxLength: 30,
              onSaved: (value) {},
            ),

            SizedBox(
              height: scaleHeight(16, context),
            ),

            DetailsTextField(
              controller: genderController,
              focusNode: gendereFocusNode,
              keyboardType: TextInputType.text,
              labelText: 'Enter your gender',
              maxLength: 30,
              onSaved: (value) {},
            ),

           
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                 Navigator.of(context).pushNamedAndRemoveUntil(
                                '/navigation', 
                                (Route<dynamic> route) =>
                                    false, 
                              );
                },
                child: Container(
                  width: scaleWidth(100, context),
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
                      'Next',
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
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    dobController.dispose();
    genderController.dispose();
    gendereFocusNode.dispose();
    dobFocusNode.dispose();
    nameFocusNode.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }
}

class DetailsSet2 extends StatelessWidget {
  const DetailsSet2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DetailsSet3 extends StatelessWidget {
  const DetailsSet3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
