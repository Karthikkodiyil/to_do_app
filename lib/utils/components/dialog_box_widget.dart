import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';

void homeDialog(BuildContext context) {
  SizeConfig().init(context);
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      AppStyles styles = AppStyles();
      return Consumer<HomePageViewmodel>(
        builder: (context, homepageController, child) => Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: kBlack.withOpacity(0.2)),
            ),
            Positioned(
              top: 150,
              left: SizeConfig.screenWidth * .5 - 200,
              child: SizedBox(
                width: 400,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: homepageController.emojiController,
                          decoration: const InputDecoration(
                              hintText: "Emoji", border: InputBorder.none),
                        ),
                        TextField(
                          controller: homepageController.titleController,
                          style: styles.greyRegular19,
                          decoration: const InputDecoration(
                              hintText: "Title", border: InputBorder.none),
                        ),
                        TextField(
                          controller: homepageController.taskController,
                          style: styles.greyRegular13,
                          decoration: const InputDecoration(
                              hintText: "0 Tasks", border: InputBorder.none),
                        ),
                        MaterialButton(
                          color: kPrimary,
                          onPressed: () {
                            homepageController.addTodo(context);
                          },
                          child: Text(
                            "ADD",
                            style: styles.whiteBold14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.screenWidth * .5 + 145,
              top: 160,
              child: Material(
                color: kTransparent,
                child: InkWell(
                  onTap: () {
                    homepageController.popFunction(context);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kBlack),
                    child: const Icon(
                      Icons.close,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

void taskDialog(BuildContext context) {
  SizeConfig().init(context);
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      AppStyles styles = AppStyles();
      return Consumer<HomePageViewmodel>(
        builder: (context, homepageController, child) => Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: kBlack.withOpacity(0.2)),
            ),
            Positioned(
              top: 150,
              left: SizeConfig.screenWidth * .5 - 200,
              child: SizedBox(
                width: 400,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          style: styles.greyRegular13,
                          decoration: const InputDecoration(
                              hintText: "Type your task",
                              border: InputBorder.none),
                        ),
                        MaterialButton(
                          color: kPrimary,
                          onPressed: () {},
                          child: Text(
                            "ADD",
                            style: styles.whiteBold14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.screenWidth * .5 + 145,
              top: 160,
              child: Material(
                color: kTransparent,
                child: InkWell(
                  onTap: () {
                    homepageController.popFunction(context);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kBlack),
                    child: const Icon(
                      Icons.close,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
