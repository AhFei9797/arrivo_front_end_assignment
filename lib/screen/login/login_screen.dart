import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_button.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: DimenConfig.getScreenWidth(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: DimenConfig.getScreenWidth(percent: 35),
              padding: EdgeInsets.symmetric(
                vertical: DimenConfig.size_24,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(DimenConfig.size_8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: DimenConfig.size_2,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, DimenConfig.size_2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildLoginLabel(),
                  SizedBox(
                    height: DimenConfig.size_24,
                  ),
                  _buildUsernameTextField(),
                  SizedBox(
                    height: DimenConfig.size_24,
                  ),
                  _buildPasswordTextField(),
                  SizedBox(
                    height: DimenConfig.size_24,
                  ),
                  _buildButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildLoginLabel() => Text(
        'Login Screen',
        style: TextStyleConfig.boldTextStyle(
          fontSize: DimenConfig.textSize_14,
        ),
      );

  Widget _buildUsernameTextField() => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DimenConfig.size_24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyleConfig.regularTextStyle(
              fontSize: DimenConfig.textSize_14,
            ),
          ),
          ThemeTextFieldWidget(),
        ],
      ));

  Widget _buildPasswordTextField() => Container(
      padding: EdgeInsets.symmetric(
        horizontal: DimenConfig.size_24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyleConfig.regularTextStyle(
              fontSize: DimenConfig.textSize_14,
            ),
          ),
          ThemeTextFieldWidget(
            obscureText: true,
            maxLines: 1,
          ),
        ],
      ));

  Widget _buildButton() => Container(
        child: ThemeButton(
          text: 'Login',
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
          },
        ),
      );
}
