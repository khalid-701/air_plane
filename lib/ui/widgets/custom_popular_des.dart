import 'package:bwa_travel_dan_pesawat/models/destinations_model.dart';
import 'package:bwa_travel_dan_pesawat/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomPolularDes extends StatelessWidget {
  final DestinationsModel destinations;


  const CustomPolularDes(this.destinations);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(destinations)));
        },
        child: Container(
          margin: EdgeInsets.only(left: defaultMargin),
          width: 200,
          height: 323,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 180,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(image: NetworkImage(destinations.imageUrl))),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(defaultRadius))),
                    child: Row(
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
                          style: blackTextStyle.copyWith(fontWeight: medium),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinations.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      destinations.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
