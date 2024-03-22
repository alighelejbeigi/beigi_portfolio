import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../generated/locales.g.dart';
import '../../../models/header_item.dart';
import '../../../provider/home.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

class Header extends ConsumerStatefulWidget {
  const Header({
    Key? key,
    required this.themeSwitch,
  }) : super(key: key);
  final Widget themeSwitch;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HeaderState(themeSwitch: themeSwitch);
}

class _HeaderState extends ConsumerState<Header>
    with SingleTickerProviderStateMixin {
  _HeaderState({
    required this.themeSwitch,
  });

  final Widget themeSwitch;

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: buildHeader(context, themeSwitch),
        mobile: buildMobileHeader(context),
        tablet: buildHeader(context, themeSwitch),
      );

  Widget buildMobileHeader(BuildContext context) => SafeArea(
        child: Container(
          decoration: _headerDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderLogo(),
              GestureDetector(
                onTap: () {
                  Globals.scaffoldKey.currentState?.openEndDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 28.0,
                ),
              )
            ],
          ),
        ),
      );

  BoxDecoration _headerDecoration() => BoxDecoration(
      color: ref.watch(themeProvider).isDarkMode
          ? MyThemes.darkScaffoldBackgroundColor
          : MyThemes.lightScaffoldBackgroundColor);

  Widget buildHeader(BuildContext context, Widget themeSwitch) => Container(
        decoration: _headerDecoration(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderLogo(),
              HeaderRow(themeSwitch: themeSwitch),
            ],
          ),
        ),
      );
}

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.all(20),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  AppConstants.logo,
                  package: 'beigi_portfolio',
                ),
              ),
            ),
          ),
        ),
      );
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  static List<NameOnTap> get languageItems => [
        NameOnTap(
          title: "ENG",
          onTap: () {
            Get.updateLocale(const Locale('en', 'US'));
          },
        ),
        NameOnTap(
          title: "فا",
          onTap: () {
            Get.updateLocale(const Locale('fa', 'IR'));
          },
        ),
      ];

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: LocaleKeys.header_home.tr,
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: LocaleKeys.header_about.tr,
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: LocaleKeys.header_services.tr,
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: LocaleKeys.header_portfolio.tr,
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: LocaleKeys.header_contact.tr,
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: LocaleKeys.header_blog.tr,
          onTap: () {
            Utilities.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.article,
        ),
        NameOnTap(
          title: LocaleKeys.header_themes.tr,
          onTap: () {},
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
      ];

  @override
  Widget build(BuildContext context) => ResponsiveVisibility(
        visible: false,
        visibleWhen: const [
          Condition.largerThan(name: MOBILE),
        ],
        child: Consumer(
          builder: (
            context,
            ref,
            child,
          ) =>
              _headerItemList(ref),
        ),
      );

  Widget _headerItemList(
    WidgetRef ref,
  ) =>
      Row(
        children: [
          ...headerItems
              .map(
                (item) => item.title == LocaleKeys.header_themes.tr
                    ? const Text("")
                    : MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              _onTapHeaderItem(item, ref);
                            },
                            child: _headerItemTitle(item),
                          ),
                        ),
                      ),
              )
              .toList(),
          const SizedBox(width: 10, height: 20, child: VerticalDivider()),
          ...languageItems
              .map(
                (item) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        item.onTap();
                      },
                      child: _languageItemTitle(item),
                    ),
                  ),
                ),
              )
              .toList(),
          const SizedBox(width: 10),
          themeSwitch
        ],
      );

  Widget _headerItemTitle(NameOnTap item) => Text(
        item.title,
        style: TextStyle(
          color: item.title == "Blogs" ? kPrimaryColor : null,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      );

  Widget _languageItemTitle(NameOnTap item) => Text(
        item.title,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          letterSpacing: 2,
        ),
      );

  void _onTapHeaderItem(NameOnTap item, WidgetRef ref) {
    item.onTap();
    HomeProvider homeProviders = ref.read(homeProvider);
    homeProviders.scrollBasedOnHeader(item);
  }
}
