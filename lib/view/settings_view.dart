import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/assets/assets.gen.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Consumer<HomePageViewmodel>(
          builder: (context, homePageController, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        homePageController.popFunction(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    "Settings",
                    style: styles.blackBold18,
                  ),
                  35.kW
                ],
              ),
              15.kH,
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(Assets.image.person2.path),
                          ),
                          15.kW,
                          Column(
                            children: [
                              Text(
                                "Malak idrissl",
                                style: styles.blackBold13,
                              ),
                              Text(
                                "Rabat, Morocco",
                                style: styles.blackRegular11,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                color: kBlack,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: kWhite,
                              )),
                        ],
                      ),
                      25.kH,
                      Text(
                        "Hi! My name is Malak, I'm a community manager from Rabat, Morocco",
                        style: styles.blackRegular12,
                      ),
                      55.kH,
                      const SettingOptionWidget(
                        name: 'Notification',
                        icon: Icon(Icons.notifications),
                      ),
                      20.kH,
                      const SettingOptionWidget(
                        name: 'General',
                        icon: Icon(Icons.settings),
                      ),
                      20.kH,
                      const SettingOptionWidget(
                        name: 'Account',
                        icon: Icon(Icons.person),
                      ),
                      20.kH,
                      const SettingOptionWidget(
                        name: 'About',
                        icon: Icon(Icons.info),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingOptionWidget extends StatelessWidget {
  final String name;
  final Icon icon;
  const SettingOptionWidget({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return SizedBox(
        child: Row(
      children: [
        icon,
        25.kW,
        Text(
          name,
          style: styles.blackBold13,
        )
      ],
    ));
  }
}
