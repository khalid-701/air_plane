import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/page_cubit.dart';
import '../../shared/theme.dart';

class CustomBottomNav extends StatelessWidget {
  final String imgUrl;
  final int index;

  const CustomBottomNav(
      {Key? key, required this.imgUrl,  required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(imgUrl,   width: 24,
            height: 24,
          color: context.read<PageCubit>().state == index ? kPrimaryColor : kGreyColor,),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index ? kPrimaryColor : kTransparent,
                borderRadius: BorderRadius.circular(defaultRadius)),
          )
        ],
      ),
    );
  }
}
