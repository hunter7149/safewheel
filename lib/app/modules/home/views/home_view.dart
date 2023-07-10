import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Obx(() => controller.pokemons.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                  itemCount: controller.pokemons.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      // height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade800)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${controller.pokemons[index]["image"]}",
                                  // height: 160,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (ctx, url, err) =>
                                      Icon(Icons.no_accounts),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "${controller.pokemons[index]["name"]}"
                                          .toUpperCase()
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.grey.shade700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ID: ${controller.pokemons[index]["id"]}"
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(
                                    //   "${controller.pokemons[index]["id"]}"
                                    //       .toUpperCase(),
                                    //   style: TextStyle(
                                    //       fontSize: 24,
                                    //       color: Colors.grey.shade700),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DETAILS, arguments: {
                                          "name":
                                              "${controller.pokemons[index]["name"]}",
                                          "image":
                                              "${controller.pokemons[index]["image"]}"
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade400),
                                        child: Center(
                                          child: Text(
                                            "Details",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade100),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })),
            )),
    );
  }
}
