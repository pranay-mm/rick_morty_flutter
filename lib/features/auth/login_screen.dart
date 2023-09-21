import 'package:data/service/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rick_morty_flutter/core/constants.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/auth/provider/authentication_provider.dart';
import 'package:rick_morty_flutter/features/auth/provider/form/auth_form_provider.dart';
import 'package:rick_morty_flutter/features/dashboard/dashboard_screen.dart';

import '../../gen/assets.gen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pref = GetIt.I.get<SharedPreferencesService>();
    ref.listen(authNotifierProvider, ((previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          pref.isUserLoggedIn=true;
          Navigator.of(context).pushReplacementNamed(DashboardPage.id);
        },
        unauthenticated: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message!),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      );
    }));

    final emailField = ref.watch(loginFormNotifierProvider).form.email;
    final passwordField = ref.watch(loginFormNotifierProvider).form.password;
    final formField = ref.watch(loginFormNotifierProvider).form;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        opacity: 0.5,
        progressIndicator:
            CircularProgressIndicator(color: context.colorScheme.onPrimary),
        inAsyncCall: ref
            .watch(authNotifierProvider)
            .maybeWhen(orElse: () => false, loading: () => true),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    height: 200.0,
                    child: Assets.images.rickAndMortyAuthBg2.image(),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Authentication',
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Pickle Rick is the only one who can crack your password. So don’t worry, and enter your credentials.',
                  style: context.textTheme.bodyMedium?.copyWith(),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {
                    ref
                        .read(loginFormNotifierProvider.notifier)
                        .setEmail(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      errorText: emailField.errorMessage,
                      hintStyle: context.textTheme.bodyMedium,
                      focusColor: context.colorScheme.onPrimary,
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          emailController.text = '';
                        },
                      ),
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: context.colorScheme.onPrimary),
                      helperText: 'It\'s the key to your portal gun!'),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (value) {
                      ref
                          .read(loginFormNotifierProvider.notifier)
                          .setPassword(value);
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        errorText: passwordField.errorMessage,
                        hintStyle: context.textTheme.bodyMedium,
                        prefixIcon: const Icon(Icons.edit_outlined),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.cancel_outlined),
                          onPressed: () {
                            passwordController.text = '';
                          },
                        ),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: context.colorScheme.onPrimary),
                        helperText:
                            'Your password must be at least 9 dimensions long!')),
                const SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.onPrimary,
                      disabledBackgroundColor:
                          context.colorScheme.onPrimary.withAlpha(100)),
                  onPressed:
                      !(formField.password.isValid && formField.email.isValid)
                          ? null
                          : () async {
                              ref.read(authNotifierProvider.notifier).login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            },
                  child: Text(
                    'Authentication',
                    style: TextStyle(
                        color: context.colorScheme.onSecondaryContainer),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Note: If no account exists, one will be created for you',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: context.colorScheme.onPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
