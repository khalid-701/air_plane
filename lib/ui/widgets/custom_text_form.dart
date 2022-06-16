import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final String title;
  final TextEditingController controller;

  const CustomTextForm(
      {Key? key,
      required this.hintText,
      this.obsecureText = false,
      required this.title,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            obscureText: obsecureText,
            controller: controller,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(color: kPrimaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}
