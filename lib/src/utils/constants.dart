import 'package:flutter/material.dart';

import '../models/header_item.dart';
import 'utils.dart';

const Color kPrimaryColor = Color(0xFF20b2aa);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;

double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class AppConstants {
  static Uri linkedInUrl = Uri.https(
    'www.linkedin.com',
    'in/alighelejbeigi/',
  );
  static Uri instagramUrl = Uri.https(
    'www.instagram.com',
    'ali_beigi_95/',
  );
  static Uri githubUrl = Uri.https(
    'github.com',
    'alighelejbeigi/',
  );
  static Uri mediumUrl = Uri.https(
    'medium.com',
    '@alighelejbeigi',
  );

  static const _assets = "assets/";

  static const _svg = "${_assets}svg/";
  static const guySvg = "${_svg}guy.svg";
  static const personSvg = "${_svg}person.svg";

  static const _images = "${_assets}images/";

  static const personPng = "assets/images/person.png";
  static const logo = "assets/images/logo.png";
  static const _socialImages = "${_images}social/";
  static const emailImage = "${_socialImages}email.png";
  static const linkedInImage = "${_socialImages}linkedin-logo.png";
  static const instagramImage = "${_socialImages}instagram.png";
  static const githubImage = "${_socialImages}github.png";
  static const mediumImage = "${_socialImages}medium.png";

  static const emailImageDark = "${_socialImages}email-dark.png";
  static const linkedInImageDark = "${_socialImages}linkedin-logo-dark.png";
  static const instagramImageDark = "${_socialImages}instagram-dark.png";
  static const githubImageDark = "${_socialImages}github-dark.png";
  static const mediumImageDark = "${_socialImages}medium-dark.png";

  static const _techImages = "${_images}technology/";
  static const flutterImage = "${_techImages}flutter.png";
  static const dartImage = "${_techImages}Dart.png";
  static const pythonImage = "${_techImages}python.png";
  static const phpImage = "${_techImages}php.png";
  static const flaskImage = "${_techImages}flask.png";
  static const firebaseImage = "${_techImages}firebase.png";
  static const razorPayImage = "${_techImages}razorpay.png";
  static const cPlusImage = "${_techImages}c++.png";
  static const swiftImage = "${_techImages}swift.png";
  static const sceneKitImage = "${_techImages}scenekit.jpeg";
  static const javascriptImage = "${_techImages}javascript.png";
  static const wpImage = "${_techImages}wp.png";
  static const scrumImage = "${_techImages}scrum.png";
  static const restApiImage = "${_techImages}restAPI.png";
  static const networkPlusImage = "${_techImages}networkPlus.png";
  static const networkAdminImage = "${_techImages}networkAdmin.png";
  static const htmlImage = "${_techImages}html.png";
  static const gitImage = "${_techImages}git.png";
  static const figmaImage = "${_techImages}figma.png";
  static const cssImage = "${_techImages}css.png";

  static const _projectsImages = "${_images}projects/";
  static const easyQRCodeImage = "${_projectsImages}1.png";
  static const easyMssqlWindowsImage = "${_projectsImages}2.png";
  static const aiChatImage = "${_projectsImages}3.png";
  static const mathSolverImage = "${_projectsImages}4.png";
  static const cryptoTrackerImage = "${_projectsImages}5.png";
  static const flowerShopImage = "${_projectsImages}6.png";
  static const todoListImage = "${_projectsImages}7.png";
  static const qrHubAppImage = "${_projectsImages}8.png";
  static const newAppComingSoonImage = "${_projectsImages}comingSoon.jpg";
  static const flutterLogoImage = "${_projectsImages}flutter.png";
  static const dartLogoImage = "${_projectsImages}dart.png";

  static List<NameOnTap> socialLoginData = [
    NameOnTap(
        title: emailImage,
        onTap: () {
          Utilities.openMail();
        }),
    NameOnTap(
        title: linkedInImage,
        onTap: () {
          Utilities.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: instagramImage,
        onTap: () {
          Utilities.openUrl(instagramUrl);
        }),
    NameOnTap(
        title: githubImage,
        onTap: () {
          Utilities.openUrl(githubUrl);
        }),
    NameOnTap(
        title: mediumImage,
        onTap: () {
          Utilities.openUrl(mediumUrl);
        }),
  ];

  static List<NameOnTap> socialLoginDataDark = [
    NameOnTap(
        title: emailImageDark,
        onTap: () {
          Utilities.openMail();
        }),
    NameOnTap(
        title: linkedInImageDark,
        onTap: () {
          Utilities.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: instagramImageDark,
        onTap: () {
          Utilities.openUrl(instagramUrl);
        }),
    NameOnTap(
        title: githubImageDark,
        onTap: () {
          Utilities.openUrl(githubUrl);
        }),
    NameOnTap(
        title: mediumImageDark,
        onTap: () {
          Utilities.openUrl(mediumUrl);
        }),
  ];
}
