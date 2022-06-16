import 'package:bwa_travel_dan_pesawat/cubit/auth_cubit.dart';
import 'package:bwa_travel_dan_pesawat/cubit/destinations_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_des_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/destinations_model.dart';
import '../widgets/custom_popular_des.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<DestinationsCubit>().fetchDes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin:
              EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy, \n${state.user.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Where to fly today?",
                          style:
                          greyTextStyle.copyWith(fontSize: 16,
                              fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/img_profile.png'))),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    //polular destination

    Widget popularDestination(List<DestinationsModel> destination) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destination.map((DestinationsModel destinations) => CustomPolularDes(destinations)).toList(),
          ),
        ),
      );
    }

    //destination tile
    Widget newDestinationTile(List<DestinationsModel> destination) {
      return Container(
        margin: EdgeInsets.only(
            top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style:
              blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(children: destination.map((DestinationsModel destinations) => CustomDesTile(destinations)).toList() ,)
          ],
        ),
      );
    }

    return BlocConsumer<DestinationsCubit, DestinationsState>(
      listener: (context, state) {
        if(state is DestinationsFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
              SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error)));
        }
      },
      builder: (context, state) {

        if(state is DestinationsSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestinationTile(state.destinations),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }

      },
    );
  }
}
