import 'package:flutter/material.dart';
import 'package:salesflo_project/ui/list_users.dart';

class UserForm extends StatelessWidget {
  const UserForm(
      {Key? key,
      required this.homeController,
      this.isUpdate = false,
      required this.onSubmit})
      : super(key: key);

  final HomeController homeController;
  final bool? isUpdate;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: homeController.nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: homeController.jobController,
            decoration: const InputDecoration(
              labelText: 'Job',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.indigo,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)
              ),
              minimumSize: const Size(200, 60)
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isUpdate! ? 'Update' : 'Add'),
            ),
          ),
        ],
      ),
    );
  }
}