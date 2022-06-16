import 'package:bwa_travel_dan_pesawat/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class CustomSeatItems extends StatelessWidget {
  //NOTE : 0. Available, 1. Selected, 2. UnAvailable

  final String id;
  final bool isAvailable;

  const CustomSeatItems({Key? key, required this.id, this.isAvailable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnAvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnAvailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if(isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: backgroundColor(),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: borderColor())),
          child: child()),
    );
  }
}
