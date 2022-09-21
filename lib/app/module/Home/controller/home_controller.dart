import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_firebase/app/module/Home/model/home_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../login/controller/create_controller.dart';

class HomeController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileControler = TextEditingController();

  onAddButtonPressed(Details model) async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());
    // final String name = nameController.text.trim();
    // final String mob = mobileControler.text.trim();
    // final String age = ageController.text.trim();
    // final String email = emailController.text.trim();

    // final model =
    //     Details(age: age, email: email, mob: mob, name: name, id: 'temp');
    final generatedID = await users.add(model.toJson());
    model.id = generatedID.id;
    await users.doc(generatedID.id).update(model.toJson());
    Get.back();
  }

  onUpdateButtonPressed(Details model) async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());

    final id = model.id;
    final String name = nameController.text.trim();
    final String mob = mobileControler.text.trim();
    final String age = ageController.text.trim();
    final String email = emailController.text.trim();

    model = Details(age: age, email: email, mob: mob, name: name, id: id);

    await users.doc(id).update(model.toJson());
  }
}
