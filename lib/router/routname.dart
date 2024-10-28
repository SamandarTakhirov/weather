part of "app_router.dart";

sealed class Routes {
  Routes._();

  static const String initial = "/";

  static const String splash = "/splash";
  static const String home = "/home";
  static const String menu = "/menu";
  static const String nointernet = "/nointernet";
}
