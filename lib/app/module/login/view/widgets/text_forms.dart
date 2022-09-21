import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key? key,
      required this.hint,
      required this.validator,
      required this.cntrlr,
      this.obscure,
      this.length,
      required this.keybord,
      required this.icon})
      : super(key: key);
  final TextEditingController? cntrlr;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final int? length;
  final bool? obscure;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validator;
          } else {
            return null;
          }
        },
        controller: cntrlr,
        keyboardType: keybord,
        obscureText: obscure ?? false,
        autocorrect: true,
        maxLength: length,
        decoration: InputDecoration(
          icon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 26, 26, 26)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
