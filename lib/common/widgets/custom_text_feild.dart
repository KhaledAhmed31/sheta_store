import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/common/app_colors.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild(
      {super.key,
      required this.hint,
      this.isPass = false,
      required this.validator, this.keyboardType, required this.controller});
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
        keyboardType:widget.keyboardType ,
        cursorColor: AppColors.main,
        decoration: InputDecoration(
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
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white, width: 2))),
      ),
    );
  }
}
