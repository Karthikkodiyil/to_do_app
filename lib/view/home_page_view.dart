import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/assets/assets.gen.dart';
import 'package:to_do_app/utils/components/dialog_box_widget.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';
import 'package:to_do_app/view_model/service/firebase_tasks_service.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    TasksService _taskService = TasksService();
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Consumer<HomePageViewmodel>(
            builder: (context, homePageController, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          homePageController.navigateSetting(context);
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(Assets.image.person2.path),
                        )),
                    Text(
                      "Categories",
                      style: styles.blackBold16,
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
                20.kH,
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kWhite,
                      border: Border.all(color: kGrey1),
                      boxShadow: const [
                        BoxShadow(
                            color: kGrey1,
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(0, 2))
                      ]),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(Assets.image.person1.path),
                    ),
                    title: Text(
                      '"The memories is a shield and life helper."',
                      style: styles.blackRegular11,
                    ),
                    subtitle: Text(
                      "Tamim Al-Barghouti",
                      style: styles.greyRegular9,
                    ),
                  ),
                ),
                25.kH,
                StreamBuilder(
                    stream: _taskService.getTodoStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("Error Occured"));
                      }
                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return Center(child: Text("No todos Added"));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var todos = snapshot.data ?? [];

                      return Expanded(
                        child: GridView.builder(
                            itemCount: todos[0]["todos"].length + 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1.4,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  index == 0
                                      ? homePageController
                                          .addButtonFunction(context)
                                      : homePageController.navigateDisc(context,
                                          todos[0]["todos"][index - 1]);
                                },
                                child: index == 0
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: kWhite,
                                            border: Border.all(color: kGrey1),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: kGrey1,
                                                  blurRadius: 2,
                                                  spreadRadius: 2,
                                                  offset: Offset(0, 2))
                                            ]),
                                        child: Center(
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                                color: kBlack,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.add,
                                              color: kWhite,
                                            ),
                                          ),
                                        ),
                                      )
                                    : TaskWidget(
                                        emoji: todos[0]["todos"][index - 1]
                                                ["emoji"] ??
                                            "",
                                        title: todos[0]["todos"][index - 1]
                                                ["title"] ??
                                            "",
                                        tasks: todos[0]["todos"][index - 1]
                                            ["tasks"]!,
                                      ),
                              );
                            }),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String emoji;
  final String title;
  final List<dynamic> tasks;
  const TaskWidget({
    super.key,
    required this.emoji,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kWhite,
          border: Border.all(color: kGrey1),
          boxShadow: const [
            BoxShadow(
                color: kGrey1,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          top: 15,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              title,
              style: styles.blackBold13,
            ),
            Text(
              "${tasks.length} tasks",
              style: styles.blackRegular13,
            ),
            const Spacer(),
            const Align(
                alignment: Alignment.bottomRight, child: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}
