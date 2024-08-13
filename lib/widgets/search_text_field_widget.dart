import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onFieldSubmitted;

  const SearchTextFieldWidget({
    super.key,
    required this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 13.sp,
      ),
      cursorColor: Colors.grey,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        hintText: 'البحث عن دورة',
        hintStyle: TextStyle(
          fontSize: 13.sp,
          color: Colors.grey[500],
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          onTap: () => controller.clear(),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          child: const Icon(Icons.close),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide(
            width: .5.w,
            color: Colors.grey[400]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide(
            width: .5.w,
            color: Colors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
