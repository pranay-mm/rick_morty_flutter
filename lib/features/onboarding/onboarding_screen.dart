import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = 'onboarding_screen';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int activePage = 0;
  bool isProgressVisible = true;
  List<String> images = [
    'images/slider_image_1.png',
    'images/slider_image_2.png',
    'images/slider_image_3.png',
  ];
  List<String> titles = [
    'Get Schwifty',
    'Wubba Lubba Dub Dub',
    'To Infinity and Beyond'
  ];
  List<String> subTitles = [
    'Get ready to have some\nfun with Rick and Morty',
    'Welcome to the Rick\nand Morty universe',
    'Explore the multiverse\nwith Rick and Morty'
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      int nextPage = activePage + 1;
      if (nextPage == images.length) {
        return;
      }
      _pageController
          .animateToPage(nextPage,
              duration: const Duration(seconds: 2), curve: Curves.easeInOut)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.85,
              width: context.width,
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Image.asset(
                    'images/rick_and_morty_auth_bg.png',
                    width: context.width * 0.6,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  SizedBox(
                    width: context.width,
                    height: context.height * 0.65,
                    child: PageView.builder(
                        physics:
                            const NeverScrollableScrollPhysics(), // disable manual swipe
                        itemCount: images.length,
                        pageSnapping: true,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            activePage = page;
                          });
                        },
                        itemBuilder: (context, pagePosition) {
                          return Column(
                            children: [
                              Container(
                                width: context.width * 0.9,
                                height: context.height * 0.35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(images[pagePosition]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: context.height * 0.03,
                              ),
                              Text(
                                titles[activePage],
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: context.height * 0.01,
                              ),
                              Text(
                                subTitles[activePage],
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyLarge,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 32, right: 32, bottom: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            navigateOnLogin(context);
                          },
                          child: Text('Skip',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(alignment: Alignment.center, children: [
                          FloatingActionButton(
                            onPressed: () {
                              log('on click');
                              navigateOnLogin(context);
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: !isProgressVisible
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onPrimary
                                      .withAlpha(100),
                            ),
                          ),
                          Visibility(
                              visible: isProgressVisible,
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(begin: 0.0, end: 1),
                                duration: const Duration(milliseconds: 8000),
                                builder: (context, value, _) =>
                                    CircularProgressIndicator(
                                  value: value,
                                ),
                                onEnd: () {
                                  setState(() {
                                    isProgressVisible = false;
                                  });
                                },
                              ))
                        ]),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

void navigateOnLogin(BuildContext context) {
  Navigator.of(context).pushReplacementNamed(LoginScreen.id);
}