import 'package:bwa_travel_dan_pesawat/cubit/auth_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailC = TextEditingController(text: '');
  final TextEditingController passwordC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign in with your\n existing account',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }

    //Tac Button
    Widget signUpButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/sign-up");
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Don\'t have an account ? Sign up',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    Widget inputSection() {


      //Email
      Widget emailInput() {
        return CustomTextForm(
          hintText: 'Your email',
          title: 'Email Address',
          controller: emailC,
        );
      }

      //Password
      Widget passwordInput() {
        return CustomTextForm(
          hintText: 'Your password',
          title: 'Password',
          obsecureText: true,
          controller: passwordC,
        );
      }


      //Submit Button
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator(),);
            }
            return CustomButton(
                title: "Sign In",
                onPressed: () {
                  context.read<AuthCubit>().signIn(email: emailC.text,
                      password: passwordC.text,);
                });
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection(), signUpButton()],
        ),
      ),
    );
  }
}
