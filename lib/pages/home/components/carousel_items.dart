import 'package:beigi_portfolio/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/carousel_item_model.dart';
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
                  builder: (context, ref, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Mobile and Web Application Developer",
                          style: GoogleFonts.josefinSans(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          "Ali Ghelej Beigi".toUpperCase(),
                          style: GoogleFonts.josefinSans(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            letterSpacing: 2.3,
                            color: ref.watch(themeProvider).isDarkMode
                                ? Colors.white
                                : MyThemes.scaffoldBackgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Software Engineer, ",
                              style: TextStyle(
                                color: kCaptionColor,
                                fontSize: 15.0,
                                height: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
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
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        InkWell(
                          onTap: () => Utilty.openUrl(AppConstants.linkedInUrl),
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
                      ],
                    );
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  return SizedBox(
                    height: carouselContainerHeight - 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: ref.watch(themeProvider).isDarkMode
                          ? AppConstants.socialLoginData
                              .map((e) => InkWell(
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
                    ),
                  );
                },
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
