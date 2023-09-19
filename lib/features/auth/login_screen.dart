import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rick_morty_flutter/core/constants.dart';
import 'package:rick_morty_flutter/core/extensions.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isShowing = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isShowing,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/rick_and_morty_auth_bg_2.png'),
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintStyle: context.textTheme.bodyMedium,
                    focusColor: context.colorScheme.onPrimary,
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {},
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: context.colorScheme.onPrimary),
                    helperText: 'It\'s the key to your portal gun!'),
              ),
              const SizedBox(
                height: 18.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintStyle: context.textTheme.bodyMedium,
                      prefixIcon: const Icon(Icons.edit_outlined),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {},
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
                    backgroundColor: context.colorScheme.onPrimary),
                onPressed: () async {
                  setState(() {
                    _isShowing = true;
                  });
                  
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
    );
  }
}
