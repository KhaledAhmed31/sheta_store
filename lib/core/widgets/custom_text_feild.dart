import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/app_colors.dart';
import '../fonts/font_size_manager.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild(
      {super.key,
      required this.hint,
      this.isPass = false,
      this.validator,
      this.keyboardType,
      required this.controller});
  final String hint;
  final bool? isPass;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  final TextEditingController controller = TextEditingController();

  bool visable = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: visable,
        keyboardType: widget.keyboardType,
        cursorColor: AppColors.main,
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: FontSizeManager.s15),
            suffixIcon: widget.isPass!
                ? IconButton(
                    icon:
                        Icon(visable ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        visable = !visable;
                      });
                    },
                  )
                : null,
            hintText: widget.hint,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              fontFamily: "Poppins",
              fontSize: FontSizeManager.s18,
              fontWeight: FontWeight.w300,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white, width: 2))),
      ),
    );
  }
}
