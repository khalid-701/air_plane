import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if(state is AuthSucces) {
          return Center(
            child: Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10))
              ], image: DecorationImage(image: AssetImage('assets/img_card.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              overflow: TextOverflow.ellipsis,
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/ic_logo.png'))),
                      ),
                      Text(
                        'Pay',
                        style:
                        whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                      ),

                    ],
                  ),
                  SizedBox(height: 41,),
                  Text('Balance', style: whiteTextStyle.copyWith(fontWeight: light),),

                  Text(state.user.balance.toString(), style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 26),)
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }

      },
    );
  }
}
