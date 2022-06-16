import 'package:bwa_travel_dan_pesawat/cubit/page_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SuccesCheckoutPage extends StatelessWidget {
  const SuccesCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img_succes.png'))),
            ),
            Text(
              "Well Booked",
              style:
              blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Are you ready to explore the new\nworld of experiences",
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              textAlign: TextAlign.center,
            ),
            CustomButton(
                width: 220,
                margin: EdgeInsets.only(top: 50),
                title: "My Bookings",
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                })
          ],
        ),
      ),
    );
  }
}
