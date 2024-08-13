import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithSearchIconAppBar extends StatelessWidget {
  final String title;
  final GestureTapCallback onSearchPressed;

  const TitleWithSearchIconAppBar({
    super.key,
    required this.title,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Title
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        /// Search Icon
        InkWell(
          onTap: onSearchPressed,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          child: Icon(Icons.search, size: 24.w),
        ),
      ],
    );
  }
}
