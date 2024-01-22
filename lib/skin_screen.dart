import 'package:flutter/material.dart';
import 'package:registration_app/main.dart';
import 'package:registration_app/skin_screen_second.dart';
import 'package:registration_app/skin_screen_third.dart';
import 'package:registration_app/skip_screen_firstly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkinScreen extends StatefulWidget {
  const SkinScreen({Key? key}) : super(key: key);

  @override
  State<SkinScreen> createState() => _SkinScreenState();
}

class _SkinScreenState extends State<SkinScreen> {
  PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: const [
            SkinScreenOne(),
            SkinScreenSecond(),
            SkinScreenThird(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.yellow,
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => Home()),
                    (route) => false);
              },
              child: const Text(
                'Boshlash',
                style: TextStyle(fontSize: 24, fontFamily: 'fonts_italic'),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text(
                        "tugatish",
                        style: TextStyle(fontFamily: 'fonts_italic'),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutSine),
                      child: const Text(
                        'Keyingisi',
                        style: TextStyle(fontFamily: 'fonts_italic'),
                      )),
                ],
              ),
            ),
    );
  }
}
