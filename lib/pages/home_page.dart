import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/pages/video_info_page.dart';
import 'package:training_app/utils/colors.dart';
import 'package:training_app/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var infoList = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/info.json')
        .then((value) {
      setState(() {
        infoList = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        margin: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  homePageTitle,
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.today,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  homePageSubtitle,
                  style: TextStyle(
                      color: AppColor.homePageSubtitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  homePageDetails,
                  style: TextStyle(
                    color: AppColor.homePageDetail,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(VideoInfoPage.tag),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(80),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(0.8),
                    AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next workout',
                    style: TextStyle(
                      color: AppColor.homePageContainerTextSmall,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                      color: AppColor.homePageContainerTextSmall,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                      color: AppColor.homePageContainerTextSmall,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.timer,
                        color: AppColor.homePageContainerTextSmall,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '60 min',
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColor.homePageContainerTextSmall),
                      ),
                      const Spacer(),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8),
                              ),
                            ],
                          ),
                          child: Icon(Icons.play_circle_fill,
                              size: 60,
                              color: AppColor.homePageContainerTextSmall)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/card.jpg',
                          ),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.3),
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                        ),
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(-1, -5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/figure.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColor.homePageDetail,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'keep it up',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.homePagePlanColor,
                          ),
                        ),
                        Text(
                          'stick to your plan',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.homePagePlanColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Area of focus',
              style: TextStyle(
                color: AppColor.homePageTitle,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: infoList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, i) => Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(infoList[i]['img']),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(5, 5),
                        ),
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(-5, -5),
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        infoList[i]['title'],
                        style: TextStyle(
                          color: AppColor.homePageDetail,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
