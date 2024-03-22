import '../utils/constants.dart';
import 'link.dart';
import 'technology.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String appPhotos;
  final Uri projectLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Flutter App",
      title: "Flower shop App",
      description:
          "This is a sample project with used Json server for training and have two rol manager and customers",
      appPhotos: AppConstants.smartStoreImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95/flower_app',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.figma,
        TechnologyConstants.restApi,
        TechnologyConstants.git,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Todo App With Hive And Bloc",
      description:
          "Implementation Todo list for used local database and Bloc state management for learning",
      appPhotos: AppConstants.crossTheRoadImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95/todo_app_with_hive_and_bloc',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.git,
      ],
      buttonText: "Github Link",
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Crypto Price(Coming soon)",
      description: "I want build Crypto price tracker with push notification",
      appPhotos: AppConstants.newAppComingSoonImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.figma,
        TechnologyConstants.restApi,
        TechnologyConstants.git,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "AI Chat Bot(Coming soon)",
      description: "A Simple AI chat with gemini",
      appPhotos: AppConstants.newAppComingSoonImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.git,
        TechnologyConstants.restApi,
      ],
    ),
    ProjectModel(
      project: "Flutter App",
      title: "Math Solver AI With Image(Coming Soon)",
      description:
          "Math Solver AI with image and gemini google for making easy to get answer the hard math problem ",
      appPhotos: AppConstants.newAppComingSoonImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.git,
        TechnologyConstants.restApi,
      ],
    ),
    ProjectModel(
      project: "Dart App",
      title: "Bus Ticket Reservation",
      description:
          "Implementation OPP for reserve Bus ticket in dart before get into the flutter.",
      appPhotos: AppConstants.personalFaceImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95/bus_app_oop_2',
      ),
      techUsed: [
        TechnologyConstants.git,
      ],
    ),
  ];
}
