import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../core/enums/enums.dart';
import '../controllers/user_profile_controller.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['name']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: Get.arguments['avatar_url'],
                      ),
                    ),
                    Text(
                      Get.arguments['login'],
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(Get.arguments['html_url'],
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ],
            ),
            GetX<UserProfileController>(
                initState: (state) =>
                    state.controller?.loadUser(Get.arguments['login']),
                builder: (controller) {
                  if (controller.appStatus.value == AppStatus.busy) {
                    return const CircularProgressIndicator();
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              controller.userDetails.value.publicRepos
                                  .toString(),
                            ),
                            const Text('Repositories')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(controller.userDetails.value.followers
                                .toString()),
                            const Text('Followers'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(controller.userDetails.value.following
                                .toString()),
                            const Text('Following'),
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
