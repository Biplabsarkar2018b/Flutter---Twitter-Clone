import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/chip.dart';
import 'package:twitter/common/loading.dart';
import 'package:twitter/constants/uiconstants.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/auth/widgets/auth_input_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final appbar = UIConstants.appbar();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
          email: _email.text,
          password: _password.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AuthInputField(controller: _email, hint: 'Email'),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthInputField(
                        controller: _password,
                        hint: 'Password',
                        hideText: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: RoundedBtn(
                          text: 'Done',
                          onTap: onSignUp,
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: const TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: ' Login',
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 16,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginView(),
                                        ),
                                      );
                                    }),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
