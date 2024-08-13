import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidget extends StatelessWidget {
  final bool isConnected;
  final String? imageLink;

  const ChatWidget({
    super.key,
    required this.isConnected,
    this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Row(
        children: [
          /// Image
          Stack(
            children: [
              /// Image
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100.r),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageLink ??
                          'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png',
                    ),
                  ),
                ),
              ),

              /// Connected icon
              Visibility(
                visible: isConnected,
                child: PositionedDirectional(
                  bottom: -2,
                  end: 0,
                  child: Container(
                    width: 14.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                        width: 2.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          12.horizontalSpace,

          /// Username and last message and time ago
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Username
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Username
                    Expanded(
                      child: Text(
                        'اسم المستخدم',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    24.horizontalSpace,

                    /// Time ago
                    Text(
                      '3 دقائق',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),

                4.verticalSpace,

                /// Last message
                Text(
                  'حدا يساعدني بخطة للفصل 2',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
