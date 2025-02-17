import 'package:flutter/material.dart';
import 'package:sheta_store/common/app_colors.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key, required this.title, required this.onpressed});
  final String title;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.main,
          padding: const EdgeInsets.symmetric(vertical: 13)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
