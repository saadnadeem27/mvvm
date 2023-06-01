import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  final _myRepo = AuthRepository();

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSignupLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils().flushBarErrorMessage('Login Sucessfully', context);
      Navigator.pushNamed(context, RoutesName.homeScreen);
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(true);

      Utils().flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);

    _myRepo.signupApi(data).then((value) {
      setSignupLoading(false);
      Utils().flushBarErrorMessage('Signup Sucessfully', context);
      Navigator.pushNamed(context, RoutesName.homeScreen);
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignupLoading(false);

      Utils().flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }
}
