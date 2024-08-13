import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback? onViewAllPressed;

  const SectionTitleWidget(
      {super.key, required this.title, this.onViewAllPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Title
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        /// View all
        Visibility(
          visible: onViewAllPressed != null,
          child: InkWell(
            onTap: onViewAllPressed,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            child: Text(
              'عرض الكل',
              style: TextStyle(fontSize: 13.sp, color: Colors.blueAccent),
            ),
          ),
        ),
      ],
    );
  }
}
