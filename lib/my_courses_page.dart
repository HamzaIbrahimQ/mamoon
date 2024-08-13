import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamoon/widgets/course_progress_widget.dart';
import 'package:mamoon/widgets/title_with_search_icon_app_bar.dart';
import 'package:mamoon/widgets/user_info_widget.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage>
    with TickerProviderStateMixin {
  late int _selectedIndex;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _selectedIndex = _tabController.index;

    /// Update selected tab index only when the tab is not changing
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
              title: 'دوراتي',
              onSearchPressed: () => _onSearchPressed(context),
            ),

            /// Divider
             Divider(color: Colors.grey[300]),

            16.verticalSpace,

            /// User info
            Row(
              children: [
                /// Image
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.r),
                    image: const DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png',
                      ),
                    ),
                  ),
                ),

                8.horizontalSpace,

                /// Username and info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Username
                      Text(
                        'اسم المستخدم',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      4.verticalSpace,

                      /// Last message
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserInfoWidget(title: 'المواد', value: 10),
                          UserInfoWidget(title: 'مكتمل', value: 3),
                          UserInfoWidget(title: 'الشهادات', value: 0),
                          UserInfoWidget(title: 'النقاط', value: 0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            24.verticalSpace,

            /// Tab bar
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.r)),
              child: TabBar(
                controller: _tabController,
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                tabs: [
                  /// First tab
                  Container(
                    width: 1.sw,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      'جميع دوراتي',
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: _selectedIndex == 0
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),

                  /// Second tab
                  Container(
                    width: 1.sw,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      'مكتمل',
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            32.verticalSpace,

            /// Chats list
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  /// All courses list
                  ListView.separated(
                    padding: EdgeInsets.only(bottom: 32.h),
                    itemCount: 6,
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Divider(color: Colors.grey[300]),
                      );
                    },
                    itemBuilder: (context, index) {
                      return CourseProgressWidget(
                        title: 'اللغة الانجليزية - الفصل الأول 2006',
                        progressValue: 65,
                        imageLink: null,
                        onTap: () {},
                      );
                    },
                  ),

                  /// Completed list
                  ListView.separated(
                    padding: EdgeInsets.only(bottom: 32.h),
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Divider(color: Colors.grey[300]),
                      );
                    },
                    itemBuilder: (context, index) {
                      return CourseProgressWidget(
                        title: 'اللغة الانجليزية - الفصل الأول 2006',
                        progressValue: 100,
                        imageLink: null,
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchPressed(BuildContext context) {}

}
