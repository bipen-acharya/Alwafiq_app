import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/dashboard/home_screen_controller.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/utils/custom_text_style.dart';
import 'package:user_app/views/object_details_screen.dart';
import 'package:user_app/views/reading_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  HomeScreen({super.key});

  final c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Alwafiq",
          style: CustomTextStyles.f16W600(color: Colors.white),
        ),
      ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //             // color: AppColors.primaryColor,
      //             ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [Center(child: Text("Alwafiq"))],
      //         ),

      //         // child: Text('Drawer Header'),
      //       ),
      //       ProfileTile(
      //         onTap: () {
      //           c.readingsListDetail.clear();
      //           c.getAllReadingList();

      //           Get.to(() => ReadingScreen());
      //         },
      //         leadingIcon: Icons.list_rounded,
      //         title: "Readings",
      //         showTrailing: false,
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Obx(
          () => c.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: c.objectListDetail.length,
                  itemBuilder: ((context, index) {
                    ObjectList objList = c.objectListDetail[index];
                    return ObjectListWidget(
                      content: "asdasd",
                      color: index % 2 == 0
                          ? AppColors.primaryColor
                          : Colors.amber,
                      objectList: objList,
                    );
                  }),
                ),
        ),
      ),
    );
  }
}

class ObjectListWidget extends StatelessWidget {
  const ObjectListWidget({
    Key? key,
    required this.content,
    required this.color,
    required this.objectList,
  }) : super(key: key);

  final String content;
  final ObjectList objectList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 19,
        right: 19,
        top: 19,
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => ObjectDetailScreen(
                objlist: objectList,
              ));
        },
        child: IntrinsicHeight(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.extraWhiteLight,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    blurRadius: 9,
                    color: AppColors.shadowColor,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: color,
                    ),
                    width: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 13, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${objectList.objectId ?? ""}',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Emirates: ${objectList.emirates ?? ""}',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Invoice Type: ${objectList.invoiceType ?? ""}',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
