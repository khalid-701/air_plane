import 'package:bwa_travel_dan_pesawat/cubit/auth_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bonus card
    Widget bonus() {
      return BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    if(state is AuthSucces) {
      return Container(
        width: 300,
        height: 211,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: kPrimaryColor.withOpacity(0.5),
              blurRadius: 50,
              offset: Offset(0, 10))
        ], image: DecorationImage(image: AssetImage('assets/img_card.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        state.user.name,
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ic_logo.png'))),
                ),
                Text(
                  'Pay',
                  style:
                  whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),

              ],
            ),
            SizedBox(height: 41,),
            Text('Balance', style: whiteTextStyle.copyWith(fontWeight: light),),

            Text(state.user.balance.toString(), style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 26),)
          ],
        ),
      );
    } else {
      return SizedBox();
    }

  },
);
    }

    //title
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
        ),
      );
    }

    //subtitle
    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that \nyou can buy anything',
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(fontWeight: light, fontSize: 16),
        ),
      );
    }

    Widget submitButton() {
      return CustomButton(
          width: 220,
          margin: EdgeInsets.only(top: 50),
          title: "Start Fly Now", onPressed: (){
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      });
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [bonus(), title(), subtitle(), submitButton()],
        ),
      ),
    );
  }
}
