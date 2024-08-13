import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamoon/models/course_model.dart';

class CourseWidget extends StatelessWidget {
  final CourseModel course;
  final GestureTapCallback onTap;

  const CourseWidget({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w, bottom: 8.h),
      child: InkWell(
        onTap: onTap,
        overlayColor:
            WidgetStateProperty.all(Colors.purple[700]?.withOpacity(.1)),
        borderRadius: BorderRadius.circular(24.r),
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: (course.isSelected ?? false)
                ? Colors.purple[700]
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              width: .5.w,
              color: Colors.grey[400]!,
            ),
          ),
          child: Text(
            course.name,
            style: TextStyle(
              fontSize: 12.5.sp,
              color: (course.isSelected ?? false) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
