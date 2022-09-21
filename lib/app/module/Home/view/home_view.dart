import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_firebase/app/module/Home/controller/home_controller.dart';
import 'package:flutter_user_firebase/app/module/Home/model/home_model.dart';
import 'package:flutter_user_firebase/app/module/Home/view/widgets/add_items.dart';
import 'package:flutter_user_firebase/app/module/login/controller/create_controller.dart';
import 'package:flutter_user_firebase/app/module/login/view/login_page.dart';
import 'package:get/get.dart';

import 'widgets/cards.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthService authController = Get.put(AuthService());
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());
    return StreamBuilder<User?>(
        stream: authController.stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoginPage();
          }
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.to(() => CreateFields(
                        homeController: _homeController,
                        type: AddOrEdit.add,
                        model: Details(),
                      ));
                },
              ),
              body: StreamBuilder(
                  stream: users.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      final newList = streamSnapshot.data!.docs.map((e) {
                        return Details.fromJson(
                            e.data() as Map<String, dynamic>);
                      }).toList();

                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    authController.signOut(context),
                                icon: const Icon(Icons.logout),
                              )
                            ],
                          ),
                          CardFields(
                            cntrlr: _homeController.nameController,
                            length: 15,
                            text: newList[0].name.toString(),
                            head: 'Name',
                            homeController: _homeController,
                            newList: newList,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.ageController,
                            length: 2,
                            text: newList[0].age.toString(),
                            head: 'Age',
                            homeController: _homeController,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.mobileControler,
                            length: 10,
                            text: newList[0].mob.toString(),
                            head: 'Mobile',
                            homeController: _homeController,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.emailController,
                            length: 30,
                            head: 'email',
                            text: newList[0].email.toString(),
                            homeController: _homeController,
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }));
        });
  }
}
