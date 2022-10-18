import 'package:flutter/material.dart';
import 'package:flutter_github_app_getx/core/routes/app_routes.dart';
import 'package:flutter_github_app_getx/presentation/pages/repository_page.dart';
import 'package:flutter_github_app_getx/presentation/pages/users_page.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.to(const RepositoryPage());
                },
                child: const Text('Repositories'),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.users);
                },
                child: const Text('Users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
