import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../generated/locales.g.dart';
import '../../../models/project.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/description_popup_text.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

class ProjectSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectSection({
    Key? key,
    required this.projects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      );

  Widget _buildUi(double width, BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: projects
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: _buildProject(width, e),
                  ),
                )
                .toList(),
          ),
        ),
      );

  Widget _buildProject(
    double width,
    ProjectModel projectModel,
  ) =>
      Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: width,
            height: ScreenHelper.isMobile(context) ? 700 : 400,
            child: Consumer(
              builder: (context, ref, _) => Container(
                padding: const EdgeInsets.all(20),
                decoration: _projectDecoration(ref),
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    _imageProject(
                      context,
                      width,
                      projectModel,
                      constraints,
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    _detailProjectItem(context, width, projectModel, ref)
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _detailProjectItem(
    BuildContext context,
    double width,
    ProjectModel projectModel,
    WidgetRef ref,
  ) =>
      SizedBox(
        width: ScreenHelper.isMobile(context) ? width * 0.9 : width * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _projectType(projectModel),
            const SizedBox(height: 15.0),
            _projectTitle(projectModel, ref),
            const SizedBox(height: 10.0),
            DescriptionPopupText(projectModel.description.tr),
            const SizedBox(height: 20.0),
            _technologyUsedTitle(projectModel, ref),
            _technologyUsedList(projectModel),
            const SizedBox(height: 25.0),
            _projectButton(projectModel)
          ],
        ),
      );

  Widget _projectButton(ProjectModel projectModel) => Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                Utilities.openUrl(projectModel.projectLink);
              },
              child: Container(
                decoration: _buttonDecoration(),
                height: 48.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: Center(
                  child: Text(
                    (projectModel.buttonText.tr).toUpperCase(),
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  BoxDecoration _buttonDecoration() => BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.0),
      );

  Widget _technologyUsedList(ProjectModel projectModel) => Wrap(
        children: projectModel.techUsed
            .map(
              (e) => Container(
                margin: const EdgeInsets.all(10),
                width: 25,
                height: 25,
                child: Image.asset(
                  e.logo,
                  package: 'beigi_portfolio',
                ),
              ),
            )
            .toList(),
      );

  Widget _technologyUsedTitle(ProjectModel projectModel, WidgetRef ref) =>
      projectModel.techUsed.isEmpty
          ? const SizedBox.shrink()
          : Text(
              LocaleKeys.project_technology_used.tr,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: ref.watch(themeProvider).isDarkMode
                    ? MyThemes.lightScaffoldBackgroundColor
                    : MyThemes.darkScaffoldBackgroundColor,
              ),
            );

  Widget _projectTitle(ProjectModel projectModel, WidgetRef ref) => Text(
        projectModel.title.tr,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          height: 1.3,
          fontSize: 28.0,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  Widget _projectType(ProjectModel projectModel) => Text(
        projectModel.project.tr,
        style: GoogleFonts.montserrat(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      );

  Widget _imageProject(BuildContext context, double width,
          ProjectModel projectModel, BoxConstraints constraints) =>
      SizedBox(
        width: ScreenHelper.isMobile(context) ? width * 0.9 : width * 0.46,
        child: Image.asset(
          projectModel.appPhotos,
          width: constraints.maxWidth > 720.0 ? null : 350.0,
          height: ScreenHelper.isMobile(context) ? 280 : 350,
          package: 'beigi_portfolio',
        ),
      );

  BoxDecoration _projectDecoration(WidgetRef ref) => BoxDecoration(
      color: ref.watch(themeProvider).isDarkMode
          ? const Color.fromARGB(75, 27, 40, 23)
          : Colors.white,
      borderRadius: BorderRadius.circular(5));
}
