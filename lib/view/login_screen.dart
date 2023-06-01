import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool isObsecture = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passowrdController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                Utils().fieldFocusChange(
                     currentFocus: _emailFocusNode,
                      nextFocus: _passwordFocusNode, 
                      context: context);
              },
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passowrdController,
              focusNode: _passwordFocusNode,
              obscureText: isObsecture,
              keyboardType: TextInputType.text,
              // onFieldSubmitted: (value){
              //   Utils().fieldFocusChange(context, currentFocus, nextFocus)
              // },
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: isObsecture
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsecture = !isObsecture;
                          });
                        },
                        child: Icon(Icons.visibility_outlined))
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsecture = !isObsecture;
                          });
                        },
                        child: Icon(Icons.visibility_off_outlined)),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            RoundButton(
              title: 'Login',
              isLoading: authViewModel.loading,
              onTap: () {
                if (_emailController.text.isEmpty) {
                  Utils().flushBarErrorMessage('Please enter email', context);
                } else if (_passowrdController.text.isEmpty) {
                  Utils()
                      .flushBarErrorMessage('Please enter password', context);
                } else if (_emailController.text.length < 6) {
                  Utils().flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passowrdController.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * .05,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signupScreen);
                },
                child: Text(
                  'Don\'t have an account ? SignUp',
                  style: TextStyle(fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }
}
