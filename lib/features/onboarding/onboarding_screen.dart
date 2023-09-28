import 'dart:developer';

import 'package:data/service/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_flutter/core/extensions.dart';
import 'package:rick_morty_flutter/features/auth/login_screen.dart';
import 'package:rick_morty_flutter/generated/l10n.dart';

import '../../gen/assets.gen.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  static const String id = 'onboarding_screen';
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int activePage = 0;
  bool isProgressVisible = true;
  List<String> images = [
    'images/slider_image_1.png',
    'images/slider_image_2.png',
    'images/slider_image_3.png',
  ];
  List<String> titles = [
    S.current.titles0,
    S.current.titles1,
    S.current.titles2,
  ];
  List<String> subTitles = [
    S.current.subtitles0,
    S.current.subtitles1,
    S.current.subtitles2,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Assets.images.rickAndMortyAuthBg
                      .image(width: context.width * 0.6),
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
                              const SizedBox(
                                height: 22,
                              ),
                              Text(
                                titles[activePage],
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 12,
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
                      TextButton(
                        onPressed: () {
                          navigateOnLogin(context);
                        },
                        child: Text(S.current.skip,
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ),
                      Stack(alignment: Alignment.center, children: [
                        FloatingActionButton(
                          onPressed: () {
                            navigateOnLogin(context);
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: !isProgressVisible
                                ? context.colorScheme.primary
                                : context.colorScheme.primary.withAlpha(100),
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
                      ])
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
  final pref = GetIt.I.get<SharedPreferencesService>();
  pref.isOnBoardingShown = true;
  Navigator.of(context).pushReplacementNamed(LoginScreen.id);
}
