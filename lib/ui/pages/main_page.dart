import 'package:bwa_travel_dan_pesawat/cubit/page_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/home_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/setting_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/transaction_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/wallet_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //content
    Widget buildContent(int currentIndex) {

      switch(currentIndex) {
        case 0 :
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3 :
          return SettingPage();
        default:
          return HomePage();
      }
    }

    //bottom Navigation
    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNav(imgUrl: 'assets/ic_home.png',  index: 0,),
              CustomBottomNav(imgUrl: 'assets/ic_book.png', index:1),
              CustomBottomNav(imgUrl: 'assets/ic_card.png',index:2),
              CustomBottomNav(imgUrl: 'assets/ic_settings.png',index:3),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}
