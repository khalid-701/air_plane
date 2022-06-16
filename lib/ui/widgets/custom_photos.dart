import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomPhotos extends StatelessWidget {
  final String imgUrl;
  const CustomPhotos({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                       Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgUrl)
          )
      ),
    );
  }
}
