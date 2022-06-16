import 'package:bwa_travel_dan_pesawat/cubit/destinations_cubit.dart';
import 'package:bwa_travel_dan_pesawat/cubit/page_cubit.dart';
import 'package:bwa_travel_dan_pesawat/cubit/seat_cubit.dart';
import 'package:bwa_travel_dan_pesawat/cubit/transaction_cubit.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/bonus_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/checkout_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/choose_seat_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/detail_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/get_started_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/main_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/sign_up_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/succes_checkout_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/transaction_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';
import 'ui/pages/setting_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/splah_page.dart';
import 'ui/pages/wallet_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationsCubit()),
        BlocProvider(create: (context) => SeatCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) =>  SplashPage(),
          '/get-started': (context) =>  GetStartedPage(),
          '/sign-up': (context) =>  SignUpPage(),
          '/sign-in': (context) =>  SignInPage(),
          '/bonus': (context) =>  BonusPage(),
          '/main': (context) =>  MainPage(),
          '/success-checkout': (context) =>  SuccesCheckoutPage(),
          '/transaction': (context) =>  TransactionPage(),
          '/wallet': (context) =>  WalletPage(),
          '/settings': (context) =>  SettingPage(),
        },
      ),
    );
  }
}
