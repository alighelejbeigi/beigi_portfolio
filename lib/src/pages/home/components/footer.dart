import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/footer_item.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconData: Icons.location_on,
      title: "ADDRESS",
      text1: "Shiraz, Far's",
      text2: "Iran",
      onTap: () {
        Utilities.openMyLocation();
      }),
  FooterItem(
      iconData: Icons.phone,
      title: "PHONE",
      text1: "+98 9354492839",
      text2: "",
      onTap: () {
        Utilities.openMyPhoneNo();
      }),
  FooterItem(
      iconData: Icons.mail,
      title: "EMAIL",
      text1: "ghelejbeigiali@gmail.com",
      text2: "",
      onTap: () {
        Utilities.openMail();
      }),
  FooterItem(
      iconData: Icons.sms,
      title: "WHATSAPP",
      text1: "+98 9354492839",
      text2: "",
      onTap: () {
        Utilities.openWhatsapp();
      })
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      );
}

Widget _buildUi(double width, BuildContext context) => Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _footerList(context, constraints),
              const SizedBox(height: 20.0),
              const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Developed in 💛 with Flutter",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

Widget _footerList(BuildContext context, BoxConstraints constraints) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: footerItems
            .map(
              (footerItem) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: _footerItem(
                  footerItem,
                  context,
                  constraints,
                ),
              ),
            )
            .toList(),
      ),
    );

Widget _footerItem(
  FooterItem footerItem,
  BuildContext context,
  BoxConstraints constraints,
) =>
    InkWell(
      onTap: footerItem.onTap,
      child: SizedBox(
        width: _widthButton(context, constraints),
        child: Consumer(
          builder: (
            BuildContext context,
            WidgetRef ref,
            Widget? child,
          ) =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconAndTitle(footerItem, ref),
              const SizedBox(height: 10.0),
              _buttonDescription(footerItem)
            ],
          ),
        ),
      ),
    );

Widget _buttonDescription(FooterItem footerItem) => RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: "${footerItem.text1}\n",
            style: const TextStyle(
              color: kCaptionColor,
              height: 1.8,
            ),
          ),
          TextSpan(
            text: "${footerItem.text2}\n",
            style: const TextStyle(
              color: kCaptionColor,
            ),
          )
        ],
      ),
    );

Widget _iconAndTitle(
  FooterItem footerItem,
  WidgetRef ref,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          footerItem.iconData,
          color: kPrimaryColor,
          size: 28,
        ),
        const SizedBox(width: 15.0),
        Text(
          footerItem.title,
          style: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: ref.watch(themeProvider).isDarkMode
                ? Colors.white
                : MyThemes.darkScaffoldBackgroundColor,
          ),
        ),
      ],
    );

double _widthButton(BuildContext context, BoxConstraints constraints) =>
    ScreenHelper.isMobile(context)
        ? constraints.maxWidth / 2.0 - 20.0
        : constraints.maxWidth / 4.0 - 20.0;
