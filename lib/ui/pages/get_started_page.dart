import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: FittedBox(
              child: Image.asset('assets/bg_started.png'),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly With Style',
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'To Infinity and \nBeyond',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  width: 220,
                  margin: EdgeInsets.only(top: 50, bottom: 80),
                    title: "Get Started",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign-in');
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
