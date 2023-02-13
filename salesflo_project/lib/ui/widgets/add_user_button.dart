import 'package:flutter/material.dart';
import 'package:salesflo_project/dio/data/di/service_locator.dart';
import 'package:salesflo_project/ui/list_users.dart';
import 'package:salesflo_project/ui/new_user.dart';
import 'package:salesflo_project/ui/widgets/add_user_form.dart';

class AddUserBtn extends StatelessWidget {
  AddUserBtn({
    Key? key,
  }) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: () {
        showModalBottomSheet(         
          context: context,
          builder: (context) {
            return UserForm(
              homeController: homeController,
              onSubmit: () async {
                await homeController.addNewUser();
                Navigator.pop(context);
                homeController.nameController.clear();
                homeController.jobController.clear();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewUserPage(),
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}