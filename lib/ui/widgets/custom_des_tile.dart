import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:flutter/material.dart';

import '../../models/destinations_model.dart';
import '../pages/detail_page.dart';

class CustomDesTile extends StatelessWidget {
  final DestinationsModel destinations;


  CustomDesTile(this.destinations);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(destinations)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(defaultRadius)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(destinations.imageUrl))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    destinations.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
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
                  destinations.rating.toString(),
                  style: blackTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
