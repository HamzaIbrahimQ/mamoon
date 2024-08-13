import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseProgressWidget extends StatelessWidget {
  final String title;
  final double progressValue;
  final String? imageLink;
  final GestureTapCallback onTap;

  const CourseProgressWidget({
    super.key,
    required this.title,
    required this.progressValue,
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
              image:  DecorationImage(
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                4.verticalSpace,

                /// Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Progress title
                    Text(
                      'تقدم المادة',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11.sp,
                      ),
                    ),

                    /// Percentage
                    Text(
                      '${progressValue.toInt()}% مكتمل',
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),

                2.verticalSpace,

                /// Progress bar
                LinearProgressIndicator(
                  value: progressValue / 100,
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.purple[700],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
