import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamoon/widgets/chat_widget.dart';
import 'package:mamoon/widgets/title_with_search_icon_app_bar.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.verticalSpace,

            /// Messages title and search icon
            TitleWithSearchIconAppBar(
              title: 'الرسائل',
              onSearchPressed: () => _onSearchPressed(context),
            ),

            /// Divider
             Divider(color: Colors.grey[300]),

            4.verticalSpace,

            /// Create new message button
            ElevatedButton(
              onPressed: () => _onAddNewMessagePressed(context),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFF9C4877)),
                fixedSize: WidgetStateProperty.all(Size(.5.sw, 40.h)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Pin icon
                  const Icon(Icons.edit, color: Colors.white),

                  8.horizontalSpace,

                  /// Title
                  Text(
                    'انشاء رسالة جديدة',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            16.verticalSpace,

            /// Chats list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) {
                  /// [isConnected] to show or hide the connection green dot
                  return ChatWidget(
                    isConnected: index % 2 == 0,
                    imageLink: null,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Divider(color: Colors.grey[300]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchPressed(BuildContext context) {}

  void _onAddNewMessagePressed(BuildContext context) {}
}
