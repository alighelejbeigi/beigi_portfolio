import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../generated/locales.g.dart';
import '../../../models/stat.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<Stat> stats = [
  Stat(count: "3+", text: LocaleKeys.stats_projects),
  Stat(count: "5+", text: LocaleKeys.stats_year_experience_it),
  Stat(count: "1", text: LocaleKeys.stats_year_experience_flutter),
];

class PortfolioStats extends StatelessWidget {
  const PortfolioStats({super.key});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth, context),
          tablet: _buildUi(kTabletMaxWidth, context),
          mobile: _buildUi(getMobileMaxWidth(context), context),
        ),
      );

  Widget _buildUi(double width, BuildContext context) => ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraint,
          ) =>
              Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: stats
                .map(
                  (stat) => Consumer(
                    builder: (context, ref, _) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      width: _widthPortfolioState(context, constraint),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _countState(stat, ref),
                          const SizedBox(width: 10.0),
                          _titleState(stat)
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );

  Widget _titleState(Stat stat) => Text(
        stat.text.tr,
        style: const TextStyle(
          fontSize: 16.0,
          color: kCaptionColor,
        ),
      );

  Widget _countState(
    Stat stat,
    WidgetRef ref,
  ) =>
      Text(
        stat.count,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: 32.0,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  double _widthPortfolioState(
    BuildContext context,
    BoxConstraints constraint,
  ) =>
      ScreenHelper.isMobile(context)
          ? constraint.maxWidth / 2.0 - 20
          : (constraint.maxWidth / 4.0 - 20);
}
