import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) => Center(
        child: LayoutBuilder(
          builder: (context, constraints) => ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              children: [
                Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15.0),
                          Text(
                            "About Me",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Text(
                            "I'm Ali Ghelej Beigi, A Flutter and Web Developer and Love to Create New Things",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "I have done my Computer Science graduation at Bahonar University of Shiraz with a bachelor's degree on 2018. I have been developing Mobile Apps for more than 1 years now.I have worked as a Team and as an Indivual in various organization and we have plan to launch many apps in Playstore as well as in Appstore. In my free time I use to learn new technics. Always love to learn new technologies and to succeed in an environment of growth and excellence and earn a job which provides me job satisfaction and self-development and help me achieve personal as well as organisational goals.",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            "Technology I have worked with",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer(
                                builder: (context, ref, _) =>
                                    ScrollConfiguration(
                                  behavior: ScrollConfiguration.of(context)
                                      .copyWith(dragDevices: {
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.mouse,
                                  }),
                                  child: SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: TechnologyConstants
                                          .technologyLearned
                                          .map(
                                            (e) => Container(
                                              decoration: BoxDecoration(
                                                color: ref
                                                        .watch(themeProvider)
                                                        .isDarkMode
                                                    ? Colors.grey[800]
                                                    : Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 6),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: Image.asset(
                                                          e.logo,
                                                          package:
                                                              'beigi_portfolio',
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        e.name,
                                                        style: const TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 70.0,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Image.asset(
                        AppConstants.personPng,
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                        package: 'beigi_portfolio',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
