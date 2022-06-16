import 'package:bwa_travel_dan_pesawat/cubit/auth_cubit.dart';
import 'package:bwa_travel_dan_pesawat/cubit/transaction_cubit.dart';
import 'package:bwa_travel_dan_pesawat/models/transaction_model.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_transactions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_book_details.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //route
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Tangerang",
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    //payments
    Widget payment() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img_card.png')),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/ic_logo.png'))),
                                ),
                                Text(
                                  "Pay",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                      .format(state.user.balance),
                                  style: blackTextStyle.copyWith(
                                      fontSize: 18, fontWeight: medium),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Current Balance',
                                  style: greyTextStyle.copyWith(
                                      fontWeight: light),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return Container();
        },
      );
    }

    //pay button
    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {

          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/success-checkout', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
                SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.error)));
          }
        },
        builder: (context, state) {

          if(state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
              margin: EdgeInsets.only(top: 15),
              title: 'Pay Now',
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              });
        },
      );
    }

    //tacButton
    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [route(),CustomTransactionCard(transaction), payment(), payButton(), tacButton()],
      ),
    );
  }
}
