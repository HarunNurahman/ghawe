import 'package:flutter/material.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/custom_text_form_field.dart';
import 'package:ghawe/shared/style.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Header widget (image, title, subtitle)
    Widget _header() {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text title
            // Text(
            //   'Lupa Password?',
            //   style: blackTextStyle.copyWith(
            //     fontSize: 20,
            //     fontWeight: light,
            //   ),
            // ),
            // SizedBox(height: defaultMargin - 10),
            // image header
            Image.asset(
              'assets/images/undraw_Forgot_password.png',
              width: 250,
            ),
          ],
        ),
      );
    }

    Widget _inputSection() {
      // email text field widget
      Widget _emailTextField() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Masukkan Email Anda',
          controller: _emailController,
        );
      }

      // button widget
      Widget _submitButton() {
        return CustomButton(
          title: 'Reset Password',
          onPressed: () {},
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _emailTextField(),
          SizedBox(height: defaultMargin),
          _submitButton(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin + 20,
            bottom: defaultMargin,
          ),
          child: Column(
            children: [
              _header(),
              SizedBox(height: defaultMargin),
              _inputSection(),
            ],
          ),
        ),
      ),
    );
  }
}
