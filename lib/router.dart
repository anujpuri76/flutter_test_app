import 'package:flutter/material.dart';
import 'package:flutter_test_app1/pages/Profile_page.dart';
import 'package:flutter_test_app1/pages/bottom_bar_page.dart';
import 'package:flutter_test_app1/pages/cart_page.dart';
import 'package:flutter_test_app1/pages/chats_page.dart';

import 'package:flutter_test_app1/pages/forgot_page.dart';

import 'package:flutter_test_app1/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: "Home",
      path: "/home",
      pageBuilder: (context, _) => MaterialPage(
        child: bottombarpage(),
      ),
    ),
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => MaterialPage(
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      name: "cart",
      path: "/cart",
      pageBuilder: (context, state) => MaterialPage(
        child: CartPage(),
      ),
    ),
    GoRoute(
      name: "forgot",
      path: "/forgot",
      pageBuilder: (context, state) => MaterialPage(
        child: forgotpage(),
      ),
    ),
    GoRoute(
      name: "chats",
      path: "/chats",
      pageBuilder: (context, state) => MaterialPage(
        child: chatspage(),
      ),
    ),
    GoRoute(
      name: "profile",
      path: "/profile",
      pageBuilder: (context, state) => MaterialPage(
        child: profilepage(),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
