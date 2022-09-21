import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_firebase/app/module/Home/controller/home_controller.dart';
import 'package:flutter_user_firebase/app/module/Home/model/home_model.dart';
import '../../../login/view/widgets/text_forms.dart';

enum AddOrEdit { add, edit }

class CreateFields extends StatelessWidget {
  CreateFields(
      {Key? key,
      required this.homeController,
      this.type = AddOrEdit.add,
      required this.model})
      : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileControler = TextEditingController();
  final HomeController homeController;
  final AddOrEdit type;
  final Details model;

  @override
  Widget build(BuildContext context) {
    if (type == AddOrEdit.edit) {
      emailController.text = model.email!;
      nameController.text = model.name!;
      ageController.text = model.age!;
      mobileControler.text = model.mob!;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
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
                        icon: CupertinoIcons.person_alt_circle,
                        length: 15,
                        validator: 'Enter your Name',
                        hint: 'Name',
                        cntrlr: nameController,
                        keybord: TextInputType.name,
                      ),
                      TextFields(
                          icon: CupertinoIcons.mail,
                          validator: 'Enter an Email',
                          hint: 'Email',
                          cntrlr: emailController,
                          keybord: TextInputType.emailAddress),
                      TextFields(
                        hint: 'Age',
                        length: 2,
                        validator: 'Age is empty',
                        cntrlr: ageController,
                        keybord: TextInputType.number,
                        icon: CupertinoIcons.number_circle,
                      ),
                      TextFields(
                        hint: 'Mob',
                        length: 10,
                        validator: 'Enter your Domain',
                        cntrlr: mobileControler,
                        keybord: TextInputType.datetime,
                        icon: CupertinoIcons.phone_circle,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              final String name = nameController.text.trim();
                              final String mob = mobileControler.text.trim();
                              final String age = ageController.text.trim();
                              final String email = emailController.text.trim();

                              final modelss = Details(
                                  age: age,
                                  email: email,
                                  mob: mob,
                                  name: name,
                                  id: 'temp');
                              if (type == AddOrEdit.add) {
                                homeController.onAddButtonPressed(modelss);
                              } else {
                                homeController.onUpdateButtonPressed(modelss);
                              }
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
