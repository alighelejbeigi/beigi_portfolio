import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../beigi_portfolio.dart';
import '../../../../generated/locales.g.dart';
import '../../../models/name_color.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

final whatIDo = [
  NameIconColor(
    title: "Mobile App Development",
    iconData: Icons.mobile_friendly,
    color: Colors.green[400]!,
  ),
  NameIconColor(
    title: "Web Development",
    iconData: Icons.web,
    color: Colors.yellow[400]!,
  ),
  NameIconColor(
    title: "UI - UX",
    iconData: Icons.design_services,
    color: Colors.blue[400]!,
  ),
  NameIconColor(
    title: "Github Open Source",
    iconData: Icons.code,
    color: Colors.orange[400]!,
  ),
];

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ScreenHelper(
          desktop: _buildUi(context, kDesktopMaxWidth),
          tablet: _buildUi(context, kTabletMaxWidth),
          mobile: _buildUi(context, getMobileMaxWidth(context)),
        ),
      );

  Widget _buildUi(BuildContext context, double width) => ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Consumer(
          builder: (context, ref, _) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _experienceTitle(ref),
                  _downloadCvButton(),
                ],
              ),
              const SizedBox(height: 20),
              _title(ref),
              const SizedBox(height: 5),
              _description(),
              SizedBox(height: ScreenHelper.isDesktop(context) ? 140 : 70),
              _whatIDoList(ref),
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      );

  Widget _whatIDoList(WidgetRef ref) => Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: whatIDo
          .map(
            (e) => Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(20),
              decoration: _itemDecoration(ref),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: _iconDecoration(ref),
                    child: Icon(
                      e.iconData,
                      color: e.color,
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _textItem(e, ref)
                ],
              ),
            ),
          )
          .toList());

  Widget _textItem(NameIconColor e, WidgetRef ref) => Text(
        e.title,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          color: ref.watch(themeProvider).isDarkMode
              ? Colors.grey[400]
              : Colors.grey[800],
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      );

  BoxDecoration _iconDecoration(WidgetRef ref) => BoxDecoration(
        color: ref.watch(themeProvider).isDarkMode
            ? Colors.grey[900]
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(80),
      );

  BoxDecoration _itemDecoration(WidgetRef ref) => BoxDecoration(
        color: ref.watch(themeProvider).isDarkMode
            ? const Color.fromARGB(75, 27, 40, 23)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
      );

  Widget _description() => Text(
        LocaleKeys.service_description.tr,
        style: GoogleFonts.montserrat(
          color: Colors.grey[400],
          fontSize: 14.0,
        ),
      );

  Widget _title(WidgetRef ref) => Text(
        LocaleKeys.service_title.tr,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          height: 1.3,
          fontSize: 35.0,
          color: ref.watch(themeProvider).isDarkMode
              ? MyThemes.lightScaffoldBackgroundColor
              : MyThemes.darkScaffoldBackgroundColor,
        ),
      );

  Widget _downloadCvButton() => GestureDetector(
        onTap: () {
          Utilities.openUrl(
            Uri.https("linkedin.com",
                "/in/ali-ghelej-beigi/" /* "/AgnelSelvan/AgnelSelvan.github.io/raw/main/assets/files/Agnel-Selvan.pdf"*/
                ),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            LocaleKeys.service_CV_button.tr,
            style: GoogleFonts.montserrat(
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
      );

  Widget _experienceTitle(WidgetRef ref) => Consumer(
        builder: (context, ref, child) {
          final locale = ref.watch(localeProvider);

          return Text(
            LocaleKeys.service_experience_title.tr,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              height: 1.8,
              letterSpacing: locale.languageCode == 'fa' ? 0 : 2,
              fontSize: 18.0,
              color: ref.watch(themeProvider).isDarkMode
                  ? MyThemes.lightScaffoldBackgroundColor
                  : MyThemes.darkScaffoldBackgroundColor,
            ),
          );
        },
      );
}
