import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherWidget extends StatelessWidget {
  final String name;

  final String course;
  final int coursesCount;
  final String? imageLink;

  const TeacherWidget({
    super.key,
    required this.name,
    required this.course,
    required this.coursesCount,
    this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              width: .5.w,
              color: Color(0xFF9C4877)!,
            ),
            image:  DecorationImage(
              image: CachedNetworkImageProvider(
                imageLink ??
                'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png',
              ),
            ),
          ),
        ),

        8.horizontalSpace,

        /// Name, course and courses count
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name
            Text(
              name,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            2.verticalSpace,

            /// Course
            Text(
              course,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[400],
              ),
            ),

            /// Courses count
            Text(
              '$coursesCount مواد',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF9C4877),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
