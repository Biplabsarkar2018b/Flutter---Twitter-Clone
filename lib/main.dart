import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/error_page.dart';
import 'package:twitter/common/loading.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/home/view/home_view.dart';
import 'package:twitter/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: ref.watch(currentUserProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeView();
              }
              return const LoginView();
            },
            error: (error, stackTrace) {
              ErrorPage(error: error.toString());
            },
            loading: () => const Scaffold(
                  body: Loader(),
                )));
  }
}
