import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invisionloginpage/app_theme.dart';
import 'package:invisionloginpage/authentication_info.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationInfo authInfo = AuthenticationInfo();
  TextEditingController _usernameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController(text: authInfo.username);
    _passwordController = TextEditingController(text: authInfo.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: MediaQuery.of(context).size.height,
            color: Blue1,
            padding: EdgeInsets.only(top: 120.0),
            child: Text(
              "W",
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width - 80.0,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: EdgeInsets.only(top: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTitleText(),
                      const SizedBox(height: 80.0),
                      _buildUsername(),
                      const SizedBox(height: 10.0),
                      _buildPassword(),
                      const SizedBox(height: 20.0),
                      _buildLoginButton(),
                      _buildRegisterButton(),
                    ],
                  ),
                  _buildForgotPasswordButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildTitleText() {
    return Text(
      "elcome",
      style: TextStyle(
        fontSize: 60.0,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildUsername() {
    return _buildTextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      hintText: "Email",
    );
  }

  Widget _buildPassword() {
    return _buildTextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      hintText: "Password",
      obscureText: true,
    );
  }

  Widget _buildTextFormField({
    final TextEditingController controller,
    final TextInputType keyboardType,
    final String hintText,
    final obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Blue4,
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      alignment: Alignment.bottomRight,
      child: ButtonTheme(
        height: 50.0,
        minWidth: 130.0,
        child: FlatButton(
          onPressed: () {},
          color: Blue1,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      alignment: Alignment.bottomRight,
      child: ButtonTheme(
        minWidth: 130.0,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            "Register",
            style: TextStyle(
              color: Blue1,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          "Forgot Password",
          style: TextStyle(
            color: Blue1,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
