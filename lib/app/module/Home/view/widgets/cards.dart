import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_user_firebase/app/module/Home/controller/home_controller.dart';
import 'package:flutter_user_firebase/app/module/Home/model/home_model.dart';
import 'package:flutter_user_firebase/app/module/Home/view/widgets/add_items.dart';
import 'package:get/get.dart';

class CardFields extends StatelessWidget {
  const CardFields(
      {Key? key,
      required this.head,
      required this.text,
      required this.length,
      required this.cntrlr,
      required this.homeController,
      required this.newList})
      : super(key: key);
  final HomeController homeController;
  final String head;
  final String text;
  final int length;
  final TextEditingController? cntrlr;
  final List<Details> newList;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 20,
      childPadding: 20,
      color: const Color.fromARGB(110, 0, 0, 0),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                head,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Get.to(CreateFields(
                      homeController: homeController,
                      model: Details(
                          age: newList[0].age,
                          email: newList[0].email,
                          mob: newList[0].mob,
                          name: newList[0].name),
                      type: AddOrEdit.edit,
                    ));
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const Spacer(),
          FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
