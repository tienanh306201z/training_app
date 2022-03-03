import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/utils/colors.dart';

class VideoInfoPage extends StatefulWidget {
  static const tag = '/video-info';

  const VideoInfoPage({Key? key}) : super(key: key);

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  var videoInfoList = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfoList = json.decode(value);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColor.gradientFirst.withOpacity(0.9),
            AppColor.gradientSecond
          ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ),
                      Icon(
                        Icons.info_outlined,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                      color: AppColor.secondPageTitleColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                      color: AppColor.secondPageTitleColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor,
                                AppColor.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.secondPageTitleColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.secondPageContainerGradient1stColor,
                                  AppColor.secondPageContainerGradient2ndColor
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.handyman_outlined,
                                size: 20,
                                color: AppColor.secondPageIconColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Resistent band, kettebell',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageTitleColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: AppColor.homePageBackground,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Circuit 1: Legs Toning',
                            style: TextStyle(
                                color: AppColor.circuitsColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.loop,
                            size: 20,
                            color: AppColor.loopColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '3 sets',
                            style: TextStyle(
                              color: AppColor.setsColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (_, i) => GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 135,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              videoInfoList[i]['thumbnail']),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          videoInfoList[i]['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(videoInfoList[i]['time'],
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade500)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFeaeefc),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        '15 rest',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF839fed),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: videoInfoList.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
