import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';

import '/controllers/home_page_controller.dart';
import '/views/widgets/shadow_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = false;
    HomePageController controller = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                left: controller.values.leftPosition,
                child: Obx(
                  () => Transform.rotate(
                      angle: controller.values.angle.value,
                      child: SvgPicture.asset(
                        'assets/circle.svg',
                        width: 200,
                        height: 200.0,
                      )),
                )),
            CustomScrollView(
                controller: controller.mainScrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: controller.values.offset,
                    pinned: false,
                    snap: false,
                    floating: false,
                    backgroundColor: Colors.transparent,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 250,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18), bottom: Radius.zero),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShadowBox(
                              width: 270,
                            ),
                            ShadowBox(
                              width: 320,
                            ),
                            ShadowBox(
                              width: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: controller.values.boxWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0,
                            color: Theme.of(context).backgroundColor,
                          ),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Obx(() => ListView.separated(
                            padding: const EdgeInsets.only(left: 20),
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                                      width: controller.values.separatorWidth,
                                    ),
                            scrollDirection: Axis.horizontal,
                            controller:
                                controller.horizontalScrollController.value,
                            itemCount: controller.values.amountOfElements,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => Container(
                                    width: controller.values.boxWidth,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                      color: (index !=
                                              controller.values
                                                  .selectedElementIndex.value)
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).highlightColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        controller.changeSelectedElement(index);
                                      },
                                    ),
                                  ));
                            })),
                      ),
                    )
                  ])),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, index) {
                      return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                              color: Theme.of(context).backgroundColor,
                            ),
                            color: Theme.of(context).backgroundColor,
                          ),
                          child: const SizedBox(
                            height: 3000,
                          ));
                    },
                    childCount: 1,
                  )),
                ]),
          ],
        ),
      ),
    );
  }
}
