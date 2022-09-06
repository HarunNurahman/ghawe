import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghawe/pages/empty-state_page.dart';
import 'package:ghawe/pages/forgot-password_page.dart';
import 'package:ghawe/pages/widgets/custom_button.dart';
import 'package:ghawe/pages/widgets/custom_text_form_field.dart';
import 'package:ghawe/shared/style.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Header widget (image, title, subtitle)
    Widget _header() {
      return Center(
        child: Column(
          children: [
            // text title
            Text(
              'Hai, Selamat Datang!',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: light,
              ),
            ),
            const SizedBox(height: 4),
            // text subtitle
            Text(
              'Senang bisa bertemu Anda',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
            SizedBox(height: defaultMargin - 10),
            // image header
            Image.asset(
              'assets/images/undraw_Welcome.png',
              width: 250,
            ),
          ],
        ),
      );
    }

    // Input section widget
    Widget _inputSection() {
      // Email text field widget
      Widget _emailTextField() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Email Anda',
          controller: _emailController,
          inputType: TextInputType.emailAddress,
        );
      }

      // Password text field widget
      Widget _passwordTextField() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Password Anda',
          controller: _passwordController,
          obsecureText: true,
        );
      }

      // Forgot password button widget
      Widget _forgotPasswordButton() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/forgot-password'),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Lupa Password? ',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }

      // Sign in button widget
      Widget _signInButton() {
        return CustomButton(
          title: 'Masuk',
          onPressed: (() {
            Get.toNamed('/dashboard');
          }),
        );
      }

      // Other sign in method widget
      Widget _loginMethod() {
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
                'atau masuk dengan',
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

        // row login method button widget
        Widget _loginMethodButton() {
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
            _loginMethodButton(),
          ],
        );
      }

      // Sign up text button widget
      Widget _signUpTextButton() {
        return Center(
          child: RichText(
            text: TextSpan(
              text: 'Belum Punya Akun? ',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
              children: [
                TextSpan(
                  text: 'Daftar Disini',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed('/sign-up'),
                ),
              ],
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _emailTextField(),
          SizedBox(height: defaultMargin - 14),
          _passwordTextField(),
          SizedBox(height: defaultMargin - 18),
          _forgotPasswordButton(),
          SizedBox(height: defaultMargin - 18),
          _signInButton(),
          SizedBox(height: defaultMargin - 8),
          _loginMethod(),
          SizedBox(height: defaultMargin),
          _signUpTextButton(),
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
                _inputSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
