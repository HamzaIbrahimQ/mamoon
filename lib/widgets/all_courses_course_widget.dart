import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCoursesCourseWidget extends StatelessWidget {
  final String title;
  final String teacherName;
  final String? imageLink;
  final GestureTapCallback onTap;

  const AllCoursesCourseWidget({
    super.key,
    required this.title,
    required this.teacherName,
    this.imageLink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Container(
            width: 88.w,
            height: 88.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  imageLink ??
                      'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png',
                ),
              ),
            ),
          ),

          8.horizontalSpace,

          /// Course name and progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Course name
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),


                /// Teacher name
                Text(
                  teacherName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),

                /// Course details
                Text(
                  'عرض تفاصيل المادة',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9C4877),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
