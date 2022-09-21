import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_user_firebase/app/module/login/controller/create_controller.dart';
import 'package:get/get.dart';

import 'widgets/text_forms.dart';

class MyRegister extends StatelessWidget {
  MyRegister({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileControler = TextEditingController();
  final authController = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 23),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFields(
                                icon: CupertinoIcons.mail,
                                validator: 'Enter an Email',
                                hint: 'Email',
                                cntrlr: emailController,
                                keybord: TextInputType.emailAddress),
                            TextFields(
                                icon: CupertinoIcons.lock_circle,
                                length: 6,
                                obscure: true,
                                validator: 'Enter a Password',
                                hint: 'Password',
                                cntrlr: passwordController,
                                keybord: TextInputType.visiblePassword),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        authController.signUp(
                                            emailController.text.trim(),
                                            passwordController.text.trim());
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              style: const ButtonStyle(),
                              child: const Text(
                                'Sign In',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ),
                            SignInButton(Buttons.GoogleDark, onPressed: () {
                              if (nameController.text.isEmpty &&
                                  mobileControler.text.isEmpty &&
                                  ageController.text.isEmpty) {
                                Get.snackbar(
                                  'About Login',
                                  'Login Message',
                                  snackPosition: SnackPosition.BOTTOM,
                                  titleText: const Text('Login failed !'),
                                  messageText: const Text(
                                    'Name , Age & Mob required',
                                  ),
                                );
                              } else {
                                // AuthController.instance.googleSignIn();
                                // DatabaseFireController.instance.addUser(
                                //     nameController.text.trim(),
                                //     ageController.text.trim(),
                                //     mobileControler.text.trim());
                              }
                            }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
