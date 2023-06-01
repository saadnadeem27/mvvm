import 'package:flutter/material.dart';
import 'package:mvvm/res/app_colors.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;
  const RoundButton(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child:isLoading?CircularProgressIndicator(
            color: Colors.white,
          ): Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
            color: AppColors.buttonColor, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
