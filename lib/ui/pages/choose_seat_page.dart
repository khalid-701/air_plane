import 'package:bwa_travel_dan_pesawat/cubit/seat_cubit.dart';
import 'package:bwa_travel_dan_pesawat/models/destinations_model.dart';
import 'package:bwa_travel_dan_pesawat/models/transaction_model.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/checkout_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationsModel destinations;

  const ChooseSeatPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //title
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    //seat status
    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //NOTE Available

            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ic_available.png'))),
                ),
                Text(
                  'Available',
                  style: blackTextStyle,
                ),
              ],
            ),

            //NOTE Selected
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ic_selected.png'))),
                ),
                Text(
                  'Selected',
                  style: blackTextStyle,
                ),
              ],
            ),

            //NOTE Not Available
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ic_not_available.png'))),
                ),
                Text(
                  'Not Available',
                  style: blackTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    //Select Seat
    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: kWhiteColor),
            child: Column(
              children: [
                //NOTE : Seat Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'A',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'B',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'C',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'D',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                  ],
                ),
                //NOTE : Seat 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSeatItems(
                        id: 'A1',
                      ),
                      CustomSeatItems(
                        id: 'B1',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      CustomSeatItems(
                        id: 'C1',
                      ),
                      CustomSeatItems(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),

                //NOTE : Seat 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSeatItems(
                        id: 'A2',
                      ),
                      CustomSeatItems(
                        id: 'B2',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      CustomSeatItems(
                        id: 'C2',
                      ),
                      CustomSeatItems(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),

                //NOTE : Seat 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSeatItems(
                        id: 'A3',
                      ),
                      CustomSeatItems(
                        id: 'B3',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      CustomSeatItems(
                        id: 'C3',
                      ),
                      CustomSeatItems(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),

                //NOTE : Seat 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSeatItems(
                        id: 'A4',
                      ),
                      CustomSeatItems(
                        id: 'B4',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      CustomSeatItems(
                        id: 'C4',
                      ),
                      CustomSeatItems(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),

                //NOTE : Seat 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSeatItems(
                        id: 'A5',
                      ),
                      CustomSeatItems(
                        id: 'B5',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      CustomSeatItems(
                        id: 'C5',
                      ),
                      CustomSeatItems(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),

                //NOTE YOUR SEAT
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                //NOTE TOTAL
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(state.length * destinations.price),
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    //Checkout
    Widget buttonCheckout() {
      return BlocConsumer<SeatCubit, List<String>>(
        listener: (context, state) {},
        builder: (context, state) {
          return CustomButton(
              margin: EdgeInsets.only(top: 30, bottom: 46),
              title: "Continue to Checkout",
              onPressed: () {

                int price = destinations.price * state.length;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      TransactionModel(
                        destinations: destinations,
                        amountOfTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: price + (price * 0.45).toInt()
                      ),
                    ),
                  ),
                );
              });
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          buttonCheckout(),
        ],
      ),
    );
  }
}
