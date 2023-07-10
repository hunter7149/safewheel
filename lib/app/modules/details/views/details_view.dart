import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade900,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Details',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : controller.pokemons.isEmpty
                  ? Center(
                      child: Text(
                        'No information found',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "${controller.imageUrl.value}",
                              height: 160,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (ctx, url, err) =>
                                  Icon(Icons.no_accounts),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${controller.pokemons['name']}'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Id: ${controller.pokemons['id']}'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Weight: ${controller.pokemons['weight']}'
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Height: ${controller.pokemons['height']}'
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ),
        ));
  }
}
