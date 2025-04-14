import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/view/browse_images_view.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/view/saved_images_view.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/bottom_navigation_wrapper.dart';
import 'package:vg_coffee_app/app/navigation/routes.dart';

class AppRouter {
  static final routes = <RouteBase>[
    StatefulShellRoute(
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: navigationShell,
        );
      },
      navigatorContainerBuilder:
          (BuildContext context, StatefulNavigationShell navigationShell, List<Widget> children) {
        return BottomNavigationWrapper(navigationShell: navigationShell, children: children);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.browse,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: BrowseImagesView(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.favorites,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: SavedImagesView(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ];

  static final router = GoRouter(
    initialLocation: Routes.browse,
    routes: routes,
    onException: (context, state, router) {
      return router.go(Routes.browse, extra: state.extra);
    },
  );

  static GoRouter testableRouter(String initialLocation) => GoRouter(
        initialLocation: initialLocation,
        routes: routes,
      );
}
