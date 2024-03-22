import '../utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python =
      TechnologyModel("Python", AppConstants.pythonImage);
  static TechnologyModel php = TechnologyModel("php", AppConstants.phpImage);
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage);
  static TechnologyModel flask =
      TechnologyModel("Flask", AppConstants.flaskImage);
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage);
  static TechnologyModel razorPay =
      TechnologyModel("Razor Pay", AppConstants.razorPayImage);
  static TechnologyModel cPlus =
      TechnologyModel("C++", AppConstants.cPlusImage);
  static TechnologyModel javascript =
      TechnologyModel("Javascript", AppConstants.javascriptImage);
  static TechnologyModel swift =
      TechnologyModel("Swift", AppConstants.swiftImage);
  static TechnologyModel sceneKit =
      TechnologyModel("SceneKit", AppConstants.sceneKitImage);
  static TechnologyModel wp =
      TechnologyModel("Wordpress", AppConstants.wpImage);
  static TechnologyModel scrum =
      TechnologyModel("Scrum", AppConstants.scrumImage);
  static TechnologyModel restApi =
      TechnologyModel("RestApi", AppConstants.restApiImage);
  static TechnologyModel networkPlus =
      TechnologyModel("NetWork Plus", AppConstants.networkPlusImage);
  static TechnologyModel networkAdmin =
      TechnologyModel("Network Admin", AppConstants.networkAdminImage);
  static TechnologyModel html = TechnologyModel("HTML", AppConstants.htmlImage);
  static TechnologyModel git = TechnologyModel("git", AppConstants.gitImage);
  static TechnologyModel figma =
      TechnologyModel("figma", AppConstants.figmaImage);
  static TechnologyModel css = TechnologyModel("CSS", AppConstants.cssImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    restApi,
    git,
    scrum,
    figma,
    html,
    css,
    javascript,
    networkPlus,
    networkAdmin,
    php,
    wp,
  ];
}
