import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import '../feature/drower/drower_page.dart';
import '../feature/home/home_page.dart';
import '../feature/splash/splash_page.dart';

part "routname.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: Routes.menu,
      name: Routes.menu,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const DrowerPage(),
    ),
  ],
);
