import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:takatuf/auth/signin.dart';
import 'package:takatuf/main.dart';
import 'package:takatuf/screens/aboutapp.dart';
import 'package:takatuf/screens/conditions.dart';
import 'package:takatuf/screens/contact.dart';
import 'package:takatuf/screens/edit_account.dart';
import 'package:takatuf/screens/favo.dart';
import 'package:takatuf/screens/notices.dart';
import 'package:takatuf/screens/private.dart';
import 'package:takatuf/screens/selectlang.dart';
import '../components/language.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> title = [
    '19'.tr,
    '20'.tr,
    '21'.tr,
    '22'.tr,
    '23'.tr,
    '24'.tr,
    '25' .tr,
    '26'.tr,
    '27'.tr
  ];
  List<Icon> icon = [
    Icon(
      Icons.edit,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      CupertinoIcons.arrowtriangle_down_square,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      CupertinoIcons.heart,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      Icons.language_outlined,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      Icons.donut_small_sharp,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      Icons.webhook_outlined,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      Icons.note,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      CupertinoIcons.phone_fill_arrow_down_left,
      size: 20,
      color: AppColors.DarkBlue,
    ),
    Icon(
      Icons.logout,
      size: 20,
      color: AppColors.Red,
    ),
  ];
  LanguageController controller1 = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo1.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'تكاتف',
                            style: AppFonts.DarkBLue_16,
                          ),
                          Text(
                            'takatuf',
                            style: AppFonts.DarkBLue_16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  notification(context)
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // if (index == 8) {
                  //   prefs!.clear();
                  //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  //     builder: (context) {
                  //       return Contact();
                  //     },
                  //   ), (route) => false);
                  // }
                },
                child: InkWell(
                  onTap: () {
                    if (index == 8) {
                      prefs!.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return Signin();
                        },
                      ), (route) => false);
                    }
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            icon[index],
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${title[index]}',
                              style: index == 8
                                  ? AppFonts.Red_16
                                  : AppFonts.DarkBLue_16,
                            ),
                          ],
                        ),
                        if (index != 8) ...[
                          IconButton(
                            onPressed: () {
                              if (index == 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Notices();
                                  },
                                ));
                              }
                              if (index == 0) {
                                Get.to(EditAccount());
                              }
                              if (index == 3) {
                                Get.to(Selectlang());
                              }
                              if (index == 2) {
                                Get.to(Favo());
                              }
                              if (index == 4) {
                                Get.to(Aboutapp());
                              }
                              if (index == 5) {
                                Get.to(Private());
                              }
                              if (index == 6) {
                                Get.to(Conditions());
                              }
                              if (index == 7) {
                                Get.to(Contact());
                              }
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 17,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
