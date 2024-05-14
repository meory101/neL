import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takatuf/components/language.dart';
import 'package:takatuf/screens/add_product.dart';
import 'package:takatuf/screens/tab_bar.dart';
import 'package:takatuf/theme/colors.dart';
import 'package:takatuf/theme/fonts.dart';

class Selectlang extends StatefulWidget {
  const Selectlang({super.key});

  @override
  State<Selectlang> createState() => _SelectlangState();
}

class _SelectlangState extends State<Selectlang> {
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Select languge",
            style: AppFonts.DarkBLue_20,
          ),
          Center(
            child: MaterialButton(
              child: Text('arabic'),
              color: AppColors.DarkBlue,
              onPressed: () async {
                controller1.ChangeLang("ar");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return CustomBottomTabBar();
                  },
                ));
              },
            ),
          ),
          Center(
            child: MaterialButton(
              child: Text('english'),
              color: AppColors.DarkBlue,
              onPressed: () async {
                controller1.ChangeLang("en");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return CustomBottomTabBar();
                  },
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
