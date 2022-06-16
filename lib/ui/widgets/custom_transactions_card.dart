import 'package:bwa_travel_dan_pesawat/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'custom_book_details.dart';

class CustomTransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const CustomTransactionCard(this.transaction,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //NOTE DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                        NetworkImage(transaction.destinations.imageUrl))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destinations.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destinations.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/ic_star.png'))),
                  ),
                  Text(
                    transaction.destinations.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            "Booking Details",
            style:
            blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),

          //Details

          CustomBookDetails(
            valueText: '${transaction.amountOfTraveler} Person',
            title: 'Traveler',
            valueColor: kBlackColor,
          ),
          CustomBookDetails(
            valueText: transaction.selectedSeats,
            title: 'Seat',
            valueColor: kBlackColor,
          ),
          CustomBookDetails(
            title: 'Insurance',
            valueText: transaction.insurance ? "YES" : "NO",
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          CustomBookDetails(
            title: 'Refundable',
            valueText: transaction.refundable ? "YES" : "NO",
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
          ),
          CustomBookDetails(
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            title: 'VAT',
            valueColor: kBlackColor,
          ),
          CustomBookDetails(
            valueText: NumberFormat.currency(
                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.grandTotal),
            title: 'Price',
            valueColor: kBlackColor,
          ),
          CustomBookDetails(
            valueText: NumberFormat.currency(
                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.grandTotal),
            title: 'Grand Total',
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
