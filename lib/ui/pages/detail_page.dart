import 'package:bwa_travel_dan_pesawat/models/destinations_model.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/choose_seat_page.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_button.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_photos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_interest.dart';

class DetailPage extends StatelessWidget {
  final DestinationsModel destinations;
  const DetailPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //background Image
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img_des1.png'), fit: BoxFit.cover)),
      );
    }

    //custom Shadow
    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    //content
    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            //NOTE: Emblem
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(destinations.imageUrl))),
            ),

            //NOTE : Title
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinations.name,
                          style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          destinations.city,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/ic_star.png'))),
                      ),
                      Text(
                        destinations.rating.toString(),
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //NOTE: Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                      destinations.about,style: blackTextStyle.copyWith(height: 2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomPhotos(
                          imgUrl: 'assets/img_photo1.png',
                        ),
                        CustomPhotos(
                          imgUrl: 'assets/img_photo2.png',
                        ),
                        CustomPhotos(
                          imgUrl: 'assets/img_photo3.png',
                        ),
                        CustomPhotos(
                          imgUrl: 'assets/img_photo1.png',
                        ),
                        CustomPhotos(
                          imgUrl: 'assets/img_photo2.png',
                        ),
                        CustomPhotos(
                          imgUrl: 'assets/img_photo3.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Interests",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      CustomInterest(
                        title: 'Kids Parks',
                      ),
                      CustomInterest(
                        title: 'Kids Parks',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomInterest(
                        title: 'Kids Parks',
                      ),
                      CustomInterest(
                        title: 'Kids Parks',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Note : Price and book button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  //NOTE : PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(destinations.price),
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ],
                    ),
                  ),

                  //NOTE : Book button

                  CustomButton(
                    title: "Book Now",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSeatPage(destinations)));
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
