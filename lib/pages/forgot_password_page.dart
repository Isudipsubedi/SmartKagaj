import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_kagaj/commonWidgets/animated_button.dart';
import 'package:smart_kagaj/commonWidgets/input_filed.dart';
import 'package:smart_kagaj/commonWidgets/onboarding_background.dart';
import 'package:smart_kagaj/constant/fonts.dart';

import '../commonWidgets/custom_snackbar.dart';

class ForgotPassword extends StatefulWidget {
  static String id = "Forgot Password";
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _resetPassword() async {
    print("${emailController.text} ");
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        print("${emailController.text} "),
        FocusScope.of(context).requestFocus(FocusNode())
      },
      child: OnbordingBackgroung(
        inputWidgets: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Lottie.asset(
                              "assets/Lottie/ForgotPassword.json"))),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter the Email to reset password",
                    style: kwhiteTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                      isrequired: true,
                      hintText: "",
                      controllerss: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      labelText: "Email",
                      prefixIcon: Icons.email_outlined),
                  const SizedBox(
                    height: 20,
                  ),
                  RiveAnimatedBtn(
                    label: "Reset Password",
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (emailController.text.isEmpty) {
                        customSnackbar(
                          context: context,
                          icons: Icons.error,
                          iconsColor: Colors.red,
                          text: 'Plese Fill the Email',
                        );
                      } else {
                        _resetPassword();
                      }
                    },
                    iconData: const Icon(Icons.restore, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
