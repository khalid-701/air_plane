import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomInterest extends StatelessWidget {
  final String title;
  const CustomInterest({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/ic_checklis.png')
              )
            ),
          ),
          Text(title, style: blackTextStyle,)
        ],
      ),
    );
  }
}
