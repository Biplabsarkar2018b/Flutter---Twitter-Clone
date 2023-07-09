import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/apis/auth_api.dart';
import 'package:twitter/apis/user_api.dart';
import 'package:twitter/core/utils.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/home/view/home_view.dart';
import 'package:twitter/models/user_model.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authAPI: ref.watch(authApiProvider),
    userAPI: ref.watch(userApiProvider),
  ),
);

final currentUserProvider = FutureProvider((ref) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.curentUser();
});

class AuthController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  Future<User?> curentUser() => _authAPI.currentUser();

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;

    res.fold(
        (l) => showSnackBar(
              context,
              l.message,
            ), (r) async {
      UserModel userModel = UserModel(
        email: email,
        name: getNameFromEmail(email),
        followers: [],
        following: [],
        profilePic: '',
        bannerPic: '',
        uid: '',
        bio: '',
        isTwitterBlue: false,
      );
      final userdata = await _userAPI.saveUserData(userModel);
      userdata.fold(
        (l) => showSnackBar(context, l.message),
        (r) {
          showSnackBar(context, 'Account Created! Please Login');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
          // showSnackBar(context, content)
        },
      );
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }
}
