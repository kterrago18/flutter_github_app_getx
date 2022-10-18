import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app_getx/core/routes/app_routes.dart';
import 'package:flutter_github_app_getx/presentation/controllers/user_controller.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
class UsersPage extends GetView<UserController> {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: GetBuilder<UserController>(
        initState: (_) => controller.loadUsers(),
        builder: (state) {
          if (state.users.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.userDetails);
                },
                child: Card(
                  margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl:
                                state.users[position].avatarUrl.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.users[position].login.toString(),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            // Text(state.data![position].htmlUrl.toString(),
                            //     style: Theme.of(context).textTheme.caption),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
