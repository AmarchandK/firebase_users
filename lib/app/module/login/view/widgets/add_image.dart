// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddImage extends StatelessWidget {
  AddImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  RxString image = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 60,
              backgroundColor: const Color.fromARGB(64, 0, 0, 0),
              backgroundImage:
                  MemoryImage(const Base64Decoder().convert(image.value)),
            ),
          ),
          const Positioned(
            bottom: 50,
            right: 50,
            child: Icon(
              Icons.add_a_photo,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
