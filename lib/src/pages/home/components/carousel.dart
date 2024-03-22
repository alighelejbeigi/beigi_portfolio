import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import 'carousel_items.dart';

class Carousel extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = _containerHeight(context);
    return SizedBox(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: _carouselOptions(carouselContainerHeight),
              items: List.generate(
                carouselItems(carouselContainerHeight).length,
                (index) => Builder(
                  builder: (BuildContext context) => Container(
                    constraints: BoxConstraints(
                      minHeight: carouselContainerHeight,
                    ),
                    child: ScreenHelper(
                      desktop: _buildDesktop(
                        context,
                        carouselItems(carouselContainerHeight)[index].text,
                        carouselItems(carouselContainerHeight)[index].image,
                      ),
                      tablet: _buildTablet(
                        context,
                        carouselItems(carouselContainerHeight)[index].text,
                        carouselItems(carouselContainerHeight)[index].image,
                      ),
                      mobile: _buildMobile(
                        context,
                        carouselItems(carouselContainerHeight)[index].text,
                        carouselItems(carouselContainerHeight)[index].image,
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  CarouselOptions _carouselOptions(double carouselContainerHeight) =>
      CarouselOptions(
        viewportFraction: 1,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        height: carouselContainerHeight,
      );

  double _containerHeight(BuildContext context) =>
      MediaQuery.of(context).size.height *
      (ScreenHelper.isMobile(context) ? .7 : .95);
}

Widget _buildDesktop(BuildContext context, Widget text, Widget image) => Center(
      child: ResponsiveWrapper(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: image,
            )
          ],
        ),
      ),
    );

Widget _buildTablet(BuildContext context, Widget text, Widget image) => Center(
      child: ResponsiveWrapper(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: image,
            )
          ],
        ),
      ),
    );

Widget _buildMobile(BuildContext context, Widget text, Widget image) =>
    Container(
      constraints: BoxConstraints(
        maxWidth: getMobileMaxWidth(context),
      ),
      width: double.infinity,
      child: text,
    );
