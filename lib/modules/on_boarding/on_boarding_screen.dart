import 'package:flutter/material.dart';
import 'package:shop_app/data/local/cache_helper.dart';
import 'package:shop_app/model/on_boarding_model.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var boardingController = PageController();
    List<OnBoardingModel> boarding = [
      OnBoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 1 Title ',
        body: 'On Boarding 1 Body',
      ),
      OnBoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 2 Title ',
        body: 'On Boarding 2 Body',
      ),
      OnBoardingModel(
        image: 'assets/images/onboarding.jpg',
        title: 'On Boarding 3 Title ',
        body: 'On Boarding 2 Body',
      ),
    ];

    bool isLast = false;
    void submit() {
      CacheHelper.saveData
        (key: "onBoarding",
          value: true)
          .then((value) {
        if(value){
          navigateToAndFinish(context,
            LoginScreen(),
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: Text('skip'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildPageView(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    activeDotColor: defaultColor,
                    spacing: 4.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast)
                    {
                      submit();
                    } else {
                      boardingController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
