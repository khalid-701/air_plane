import 'package:bwa_travel_dan_pesawat/cubit/auth_cubit.dart';
import 'package:bwa_travel_dan_pesawat/shared/theme.dart';
import 'package:bwa_travel_dan_pesawat/ui/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

final TextEditingController emailC = TextEditingController(text: '');
final TextEditingController passwordC = TextEditingController(text: '');
final TextEditingController nameC = TextEditingController(text: '');
final TextEditingController hobbyC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and\nBeyond',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }


    Widget signInButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            'Have an account ? Sign in',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }
    //Tac Button
    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 50,
          bottom: 20,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline),
        ),
      );
    }

    Widget inputSection() {
      //Name
      Widget nameInput() {
        return CustomTextForm(
          hintText: 'Your full name',
          title: 'Full Name',
          controller: nameC,
        );
      }

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

      //Hobby
      Widget hobbyInput() {
        return CustomTextForm(
          hintText: 'Your Hobby',
          title: 'Hobby',
          controller: hobbyC,
        );
      }

      //Submit Button
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
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
                title: "Get Started",
                onPressed: () {
                  context.read<AuthCubit>().signUp(email: emailC.text,
                      password: passwordC.text,
                      name: nameC.text,
                      hobby: hobbyC.text);
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
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
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
          children: [title(), inputSection(), tacButton(), signInButton()],
        ),
      ),
    );
  }
}
