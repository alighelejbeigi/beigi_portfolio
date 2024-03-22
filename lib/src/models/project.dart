import '../../generated/locales.g.dart';
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
  final String buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    required this.appPhotos,
    required this.projectLink,
    required this.techUsed,
    required this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: LocaleKeys.project_type_flutter,
      title: LocaleKeys.project_title_flower,
      description: LocaleKeys.project_description_flower,
      appPhotos: AppConstants.flutterLogoImage,
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
      buttonText: LocaleKeys.project_github_link_button,
    ),
    ProjectModel(
      project: LocaleKeys.project_type_flutter,
      title: LocaleKeys.project_title_todo,
      description: LocaleKeys.project_description_todo,
      appPhotos: AppConstants.flutterLogoImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95/todo_app_with_hive_and_bloc',
      ),
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.git,
      ],
      buttonText: LocaleKeys.project_github_link_button,
    ),
    ProjectModel(
      project: LocaleKeys.project_type_flutter,
      title: LocaleKeys.project_title_crypto,
      description: LocaleKeys.project_description_crypto,
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
      buttonText: LocaleKeys.project_explore_more_button,
    ),
    ProjectModel(
      project: LocaleKeys.project_type_flutter,
      title: LocaleKeys.project_title_ai,
      description: LocaleKeys.project_description_ai,
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
      buttonText: LocaleKeys.project_explore_more_button,
    ),
    ProjectModel(
      project: LocaleKeys.project_type_flutter,
      title: LocaleKeys.project_title_math_solver,
      description: LocaleKeys.project_description_math_solver,
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
      buttonText: LocaleKeys.project_explore_more_button,
    ),
    ProjectModel(
      project: LocaleKeys.project_type_dart,
      title: LocaleKeys.project_title_bus,
      description: LocaleKeys.project_description_bus,
      appPhotos: AppConstants.dartLogoImage,
      projectLink: Uri.https(
        'www.github.com',
        'alibeigi95/bus_app_oop_2',
      ),
      techUsed: [
        TechnologyConstants.git,
      ],
      buttonText: LocaleKeys.project_github_link_button,
    ),
  ];
}
