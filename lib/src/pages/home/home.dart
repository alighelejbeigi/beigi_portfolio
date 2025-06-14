import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:beigi_portfolio/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/project.dart';
import '../../provider/home.dart';
import '../../provider/theme.dart';
import '../../utils/globals.dart';
import '../../utils/screen_helper.dart';
import '../../widgets/switch.dart';
import 'components/about.dart';
import 'components/carousel.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/portfolio_stats.dart';
import 'components/project.dart';
import 'components/service.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  Widget _buildPage() => Stack(
        children: [
          ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenHelper.isDesktop(context) ? 30 : 20,
                  ),
                  Carousel(
                    key: _homeProvider.homeKey,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AboutSection(
                    key: _homeProvider.aboutKey,
                  ),
                  ServiceSection(
                    key: _homeProvider.servicesKey,
                  ),
                  SizedBox(
                    key: _homeProvider.portfolioKey,
                    height: 120.0,
                  ),
                  _portfolioSection(),
                  ProjectSection(
                    projects: ProjectModel.projects,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: PortfolioStats(),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Footer(
                    key: _homeProvider.contactKey,
                  )
                ],
              ),
            ),
          ),
          _header(),
        ],
      );

  Widget _header() => Header(
        themeSwitch: ThemeSwitcher(
          clipper: const ThemeSwitcherBoxClipper(),
          builder: (context) => CustomSwitch(
            value: ref.watch(themeProvider).isDarkMode,
            onChanged: (val) {
              ref.read(themeProvider).changeTheme(val);
              ThemeSwitcher.of(context).changeTheme(
                theme: ref.read(themeProvider).getCurrentTheme,
              );
            },
          ),
        ),
      );

  Widget _portfolioSection() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _portfolioSectionTitle(),
            const SizedBox(height: 5),
            _portfolioSectionDescription(),
            const SizedBox(height: 15)
          ],
        ),
      );

  Widget _portfolioSectionDescription() => Text(
        LocaleKeys.home_description.tr,
        style: GoogleFonts.josefinSans(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      );

  Widget _portfolioSectionTitle() => Text(
        LocaleKeys.home_portfolio.tr,
        style: GoogleFonts.josefinSans(
          fontWeight: FontWeight.w900,
          fontSize: 36,
          color: _textAndIconColor(),
        ),
      );

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Scaffold(
          backgroundColor: _backgroundColor(),
          key: Globals.scaffoldKey,
          endDrawer: Drawer(
            backgroundColor: _backgroundColor(),
            child: SafeArea(
              child: Padding(
                padding: _paddingThemeSwitchArea(),
                child: _drawerList(),
              ),
            ),
          ),
          body: _buildPage(),
        ),
      );

  Widget _drawerList() => ListView.separated(
        itemBuilder: (BuildContext context, int index) => ListTile(
          onTap: () {
            _onTapDrawer(context, index);
          },
          leading: Icon(HeaderRow.headerItems[index].iconData,
              color: _textAndIconColor()),
          title: Text(
            HeaderRow.headerItems[index].title,
            style: TextStyle(color: _textAndIconColor()),
          ),
          trailing: HeaderRow.headerItems[index].isDarkTheme != null
              ? HeaderRow.headerItems[index].isDarkTheme!
                  ? _switchTheme(context)
                  : null
              : null,
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10.0),
        itemCount: HeaderRow.headerItems.length,
      );

  Widget _switchTheme(BuildContext context) => SizedBox(
        width: 50,
        child: CustomSwitch(
          value: ref.watch(themeProvider).isDarkMode,
          onChanged: (val) {
            ref.read(themeProvider).changeTheme(val);
            ThemeSwitcher.of(context).changeTheme(
              theme: ref.read(themeProvider).getCurrentTheme,
            );
          },
        ),
      );

  void _onTapDrawer(BuildContext context, int index) {
    if (Globals.scaffoldKey.currentState != null) {
      if (Globals.scaffoldKey.currentState!.isEndDrawerOpen) {
        Navigator.pop(context);
        _homeProvider.scrollBasedOnHeader(HeaderRow.headerItems[index]);
      }
    }
  }

  EdgeInsets _paddingThemeSwitchArea() => const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      );

  Color _backgroundColor() => ref.watch(themeProvider).isDarkMode
      ? MyThemes.darkScaffoldBackgroundColor
      : MyThemes.lightScaffoldBackgroundColor;

  Color _textAndIconColor() => ref.watch(themeProvider).isDarkMode
      ? MyThemes.lightScaffoldBackgroundColor
      : MyThemes.darkScaffoldBackgroundColor;
}
