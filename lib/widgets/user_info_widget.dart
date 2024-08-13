import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoWidget extends StatelessWidget {
  final String title;
  final int value;

  const UserInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            /// Title
            TextSpan(
              text: title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            /// Value
            TextSpan(
              text: ' $value',
              style: TextStyle(
                color: Colors.purple[700],
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
