import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/utils/components/size_config.dart';
import 'package:to_do_app/view/widgets/doted_container.dart';
import 'package:to_do_app/view/widgets/floating_button_component.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';

class ToDoDiscView extends StatelessWidget {
  const ToDoDiscView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButton: const FloatingButtonComponent(),
      body: SafeArea(child: Consumer<HomePageViewmodel>(
          builder: (context, homePageController, child) {
        final todos = homePageController.selectedTodo!;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      homePageController.popFunction(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  todos["title"] ?? "",
                  style: styles.blackBold18,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos["tasks"]!.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todos["tasks"]![index]["date"]),
                            3.kH,
                            ContentWidget(
                                dateTask: todos["tasks"]![index]["dateTask"]),
                            8.kH,
                          ],
                        ),
                      )),
            )
          ],
        );
      })),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.dateTask,
  });

  final List<dynamic> dateTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dateTask.length,
        itemBuilder: (context, index) => Consumer<HomePageViewmodel>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                child: Row(
                  children: [
                    dateTask[index]["isCompleted"] == true
                        ? Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                color: kGreen, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.check,
                              color: kWhite,
                              size: 16,
                            ),
                          )
                        : const DotedContainer(),
                    20.kW,
                    Text(dateTask[index]["task"])
                  ],
                ),
              ),
            ));
  }
}
