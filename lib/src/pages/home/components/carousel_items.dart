import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/carousel_item_model.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

List<CarouselItemModel> carouselItems(double carouselContainerHeight) =>
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Stack(
            children: [
              Center(
                child: Consumer(
                  builder: (context, ref, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _firstTitle(),
                      const SizedBox(height: 18.0),
                      _secondTitle(ref),
                      const SizedBox(height: 10.0),
                      _subjectAndLocation(),
                      const SizedBox(height: 25.0),
                      _talkButton(),
                      const SizedBox(height: 35.0),
                      _socialList(ref)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        image: SvgPicture.asset(
          AppConstants.guySvg,
          semanticsLabel: 'Guy Logo',
          package: 'beigi_portfolio',
        ),
      ),
    );

Widget _socialList(WidgetRef ref) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: ref.watch(themeProvider).isDarkMode
          ? AppConstants.socialLoginData
              .map((e) => InkWell(
                    hoverColor: kPrimaryColor,
                    onTap: e.onTap,
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        e.title,
                        package: 'beigi_portfolio',
                      ),
                    ),
                  ))
              .toList()
          : AppConstants.socialLoginDataDark
              .map((e) => InkWell(
                    hoverColor: kPrimaryColor,
                    onTap: e.onTap,
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        e.title,
                        package: 'beigi_portfolio',
                      ),
                    ),
                  ))
              .toList(),
    );

Widget _talkButton() => Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () => Utilities.openUrl(AppConstants.linkedInUrl),
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 48.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's Talk",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget _subjectAndLocation() => const Row(
      children: [
        Text(
          "Software Engineer, ",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.location_on,
          color: kCaptionColor,
          size: 14,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "Iran , Shiraz",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        )
      ],
    );

Widget _secondTitle(WidgetRef ref) => Text(
      "Ali Ghelej Beigi".toUpperCase(),
      style: GoogleFonts.montserrat(
        fontSize: 40.0,
        fontWeight: FontWeight.w500,
        height: 1.3,
        letterSpacing: 2.3,
        color: ref.watch(themeProvider).isDarkMode
            ? MyThemes.lightScaffoldBackgroundColor
            : MyThemes.darkScaffoldBackgroundColor,
      ),
    );

Widget _firstTitle() => Text(
      "Mobile and Web Application Developer",
      style: GoogleFonts.montserrat(
        color: kPrimaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        letterSpacing: 2,
      ),
    );
