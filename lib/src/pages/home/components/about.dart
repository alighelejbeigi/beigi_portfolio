import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../generated/locales.g.dart';
import '../../../models/technology.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      );

  Widget _buildUi(double width) => Center(
        child: LayoutBuilder(
          builder: (context, constraints) => ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Consumer(
                      builder: (context, ref, _) => Expanded(
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15.0),
                            _aboutMe(ref),
                            const SizedBox(height: 25.0),
                            _title(ref),
                            const SizedBox(height: 10.0),
                            _description(),
                            const SizedBox(height: 20.0),
                            _technologyTitle(ref),
                            const SizedBox(height: 10.0),
                            _technologyLists(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    _portfolioImage(constraints),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _portfolioImage(BoxConstraints constraints) => Expanded(
        flex: constraints.maxWidth > 720.0 ? 1 : 0,
        child: Image.asset(
          AppConstants.personPng,
          width: constraints.maxWidth > 720.0 ? null : 350.0,
          package: 'beigi_portfolio',
        ),
      );

  Widget _technologyLists() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (context, ref, _) => ScrollConfiguration(
              behavior: _scrollBehavior(context),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: _technologyList(ref),
              ),
            ),
          ),
          const SizedBox(height: 70.0)
        ],
      );

  Widget _technologyList(WidgetRef ref) => Row(
        children: TechnologyConstants.technologyLearned
            .map(
              (e) => Container(
                decoration: _technologyItemDecoration(ref),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: Center(
                  child: Row(
                    children: [
                      _imageTechnologyItem(e),
                      const SizedBox(width: 10),
                      _nameTechnologyItem(e, ref),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      );

  Widget _nameTechnologyItem(TechnologyModel e, WidgetRef ref) => Text(
        e.name,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: ref.watch(themeProvider).isDarkMode
              ? Colors.white
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  Widget _imageTechnologyItem(TechnologyModel e) => SizedBox(
        width: 20,
        height: 20,
        child: Image.asset(
          e.logo,
          package: 'beigi_portfolio',
        ),
      );

  BoxDecoration _technologyItemDecoration(WidgetRef ref) => BoxDecoration(
        color: ref.watch(themeProvider).isDarkMode
            ? Colors.grey[800]
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(4.0),
      );

  ScrollBehavior _scrollBehavior(BuildContext context) =>
      ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      });

  Widget _technologyTitle(WidgetRef ref) => Text(
        LocaleKeys.about_me_technology_title.tr,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  Widget _description() => Text(
        LocaleKeys.about_me_description.tr,
        style: const TextStyle(
          color: kCaptionColor,
          height: 1.5,
          fontSize: 15.0,
        ),
      );

  Widget _title(WidgetRef ref) => Text(
        LocaleKeys.about_me_title.tr,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          height: 1.3,
          fontSize: 24.0,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  Widget _aboutMe(WidgetRef ref) => Text(
        LocaleKeys.about_me_about_me_title.tr,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          height: 1.3,
          fontSize: 35.0,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );
}
