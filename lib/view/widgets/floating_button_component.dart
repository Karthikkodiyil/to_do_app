import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/utils/app_color.dart';
import 'package:to_do_app/utils/components/dialog_box_widget.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';

class FloatingButtonComponent extends StatelessWidget {
  const FloatingButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewmodel>(
      builder: (context, homepageController, child) => FloatingActionButton(
        backgroundColor: kBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        onPressed: () {
          homepageController.floatButtonFunction(context);
        },
        child: const Icon(
          Icons.add,
          color: kWhite,
          size: 35,
        ),
      ),
    );
  }
}
