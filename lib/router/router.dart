import 'package:closeby/view/explore.dart';
import 'package:closeby/view/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const Explore();
          }),
      GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          })
    ],
  );
}
