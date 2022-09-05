import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/custom_text_form_field.dart';
import 'package:ghawe/shared/style.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Center(
        child: Column(
          children: [
            // text title
            Text(
              'Baru Bergabung?',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: light,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ayo Daftar Dulu Ya!',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
            SizedBox(height: defaultMargin - 10),
            Image.asset(
              'assets/images/undraw_Join.png',
              width: 250,
            )
          ],
        ),
      );
    }

    Widget _inputSection() {
      // Full name text field widget
      Widget _nameTextField() {
        return CustomTextFormField(
          title: 'Nama Lengkap',
          hintText: 'Masukkan Nama Lengkap',
          controller: _nameController,
        );
      }

      // Phone number text field widget
      Widget _phoneTextField() {
        return Column(
          children: [
            CustomTextFormField(
              title: 'No. Handphone',
              hintText: 'Masukkan No. Handphone Anda',
              controller: _phoneController,
              inputType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Contoh: 081234567890',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                    color: kBlackColor.withOpacity(0.5),
                  ),
                )
              ],
            )
          ],
        );
      }

      // Email text field widget
      Widget _emailTextField() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Masukkan Email Anda',
          controller: _emailController,
        );
      }

      // Password text field widget
      Widget _passwordTextField() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Masukkan Password Anda',
          controller: _passwordController,
          obsecureText: true,
        );
      }

      // Sign up button widget
      Widget _signUpButton() {
        return CustomButton(
          title: 'Daftar',
          onPressed: () => Get.toNamed('sign-in'),
        );
      }

      // Other sign up method widget
      Widget _signUpMethod() {
        // separation widget
        Widget _separator() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Divider(
                    thickness: 1,
                    color: kBlackColor.withOpacity(0.5),
                  ),
                ),
              ),
              Text(
                'atau daftar dengan',
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                  color: kBlackColor.withOpacity(0.5),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Divider(
                    thickness: 1,
                    color: kBlackColor.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          );
        }

        // row signup method button widget
        Widget _signupMethodButton() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_login_google.png',
                width: 48,
              ),
              const SizedBox(width: 18),
              Image.asset(
                'assets/images/img_login_facebook.png',
                width: 48,
              ),
              const SizedBox(width: 18),
              Image.asset(
                'assets/images/img_login_linkedin.png',
                width: 48,
              ),
            ],
          );
        }

        return Column(
          children: [
            _separator(),
            SizedBox(height: defaultMargin - 8),
            _signupMethodButton(),
          ],
        );
      }

      // Sign in text button widget
      Widget _signInTextButton() {
        return Center(
          child: RichText(
            text: TextSpan(
              text: 'Sudah Punya Akun? ',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
              children: [
                TextSpan(
                  text: 'Masuk Disini',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed('/sign-in'),
                ),
              ],
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameTextField(),
          SizedBox(height: defaultMargin - 14),
          _phoneTextField(),
          _emailTextField(),
          SizedBox(height: defaultMargin - 14),
          _passwordTextField(),
          SizedBox(height: defaultMargin),
          _signUpButton(),
          SizedBox(height: defaultMargin - 5),
          _signUpMethod(),
          SizedBox(height: defaultMargin),
          _signInTextButton(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(height: defaultMargin - 10),
                _inputSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
