import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamoon/models/course_model.dart';
import 'package:mamoon/widgets/course_widget.dart';
import 'package:mamoon/widgets/search_text_field_widget.dart';
import 'package:mamoon/widgets/section_title_widget.dart';
import 'package:mamoon/widgets/teacher_widget.dart';

import 'widgets/all_courses_course_widget.dart';

class AllCoursesPage extends StatefulWidget {
  const AllCoursesPage({super.key});

  @override
  State<AllCoursesPage> createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<CourseModel> courses = [
    CourseModel(name: 'الرياضيات', isSelected: true),
    CourseModel(name: 'اللغة الانجليزية'),
    CourseModel(name: 'الكيمياء'),
    CourseModel(name: 'الفيزياء'),
    CourseModel(name: 'العلوم الحياتية'),
    CourseModel(name: 'اللغة العربية المشتركة'),
    CourseModel(name: 'اللغة العربية تخصص'),
    CourseModel(name: 'علوم الحاسوب'),
    CourseModel(name: 'مواد الأدبي'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
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

            /// Messages title and search icon
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 48.h),
              child: SearchTextFieldWidget(
                controller: _searchController,
                onFieldSubmitted: (value) => _onSearchSubmitted(value),
              ),
            ),

            20.verticalSpace,

            /// Page content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Title
                    const SectionTitleWidget(title: 'المادة المطلوبة'),

                    20.verticalSpace,

                    /// Courses
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Wrap(
                          children: courses
                              .map(
                                (item) => CourseWidget(
                              course: item,
                              onTap: () => _onCourseSelected(item),
                            ),
                          )
                              .toList(),
                        );
                      },
                    ),

                    24.verticalSpace,

                    /// Title
                    SectionTitleWidget(
                      title: 'أساتذة موقع وتد',
                      onViewAllPressed: () {},
                    ),

                    20.verticalSpace,

                    /// Teachers grid
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        mainAxisSpacing: 16.h,
                        // crossAxisSpacing: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        return const TeacherWidget(
                          name: 'حسام العبسي',
                          course: 'الرياضيات العلمي',
                          coursesCount: 4,
                          imageLink: null,
                        );
                      },
                    ),

                    16.verticalSpace,

                    /// Title
                    const SectionTitleWidget(title: 'جميع المواد'),

                    16.verticalSpace,

                    /// Courses list
                    ListView.separated(
                      padding: EdgeInsets.only(bottom: 32.h),
                      shrinkWrap: true,
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        /// [isConnected] to show or hide the connection green dot
                        return AllCoursesCourseWidget(
                          title: 'اللغة الانجليزية - الفصل الأول 2006',
                          teacherName: 'الأستاذ محمد مشعل',
                          imageLink: null,
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Divider(color: Colors.grey[300]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCourseSelected(CourseModel course) {
    if (course.isSelected == true) return;
    setState(() {
      for (var course in courses) {
        course.isSelected = false;
      }
      course.isSelected = true;
    });
  }

  void _onSearchSubmitted(String value) {}
}
