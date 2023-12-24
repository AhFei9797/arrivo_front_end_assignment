import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:arrivo_frond_end_assignment/screen/login/bloc/login_bloc.dart';
import 'package:arrivo_frond_end_assignment/screen/login/bloc/login_event.dart';
import 'package:arrivo_frond_end_assignment/screen/login/bloc/login_state.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_button.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginScreenBloc>(
        create: (_) => LoginScreenBloc(),
        child: Container(
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
      ),
    );
  }

  _buildLoginLabel() => Text(
        'Login Screen',
        style: TextStyleConfig.boldTextStyle(
          fontSize: DimenConfig.textSize_14,
        ),
      );

  Widget _buildUsernameTextField() => BlocBuilder<LoginScreenBloc, LoginScreenState>(builder: (context, state) {
        return Container(
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
              ThemeTextFieldWidget(
                maxLines: 1,
                textEditingController: _usernameController,
                onTextChanged: (text) {
                  BlocProvider.of<LoginScreenBloc>(context).add(LoginScreenOnSetUsernameEvent(text));
                },
              ),
            ],
          ),
        );
      });

  Widget _buildPasswordTextField() => BlocBuilder<LoginScreenBloc, LoginScreenState>(builder: (context, state) {
        return Container(
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
                  textEditingController: _passwordController,
                  onTextChanged: (text) {
                    BlocProvider.of<LoginScreenBloc>(context).add(LoginScreenOnSetPasswordEvent(text));
                  },
                ),
              ],
            ));
      });

  Widget _buildButton() => BlocBuilder<LoginScreenBloc, LoginScreenState>(builder: (context, state) {
        return Container(
          child: ThemeButton(
            text: 'Login',
            onPressed: () {
              BlocProvider.of<LoginScreenBloc>(context).add(LoginScreenOnLoginEvent());
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            },
            enable: state.usernameStream.isNotEmpty && state.passwordStream.isNotEmpty,
          ),
        );
      });
}
