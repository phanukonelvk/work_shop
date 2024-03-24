import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_shop/home/screen/home_detail_screen.dart';
import 'package:work_shop/home/screen/home_screen.dart';

enum Routes {
  home,
  movieDetail,
  bookmarks,
}

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    // initialLocation: "/",x/
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          path: '/movieDetail',
          name: Routes.movieDetail.name,
          builder: (context, state) =>
              HomeScreenDetail(key: state.pageKey, id: state.extra as String)),
    ],
  );
}
