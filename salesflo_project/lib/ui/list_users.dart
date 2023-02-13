import 'package:flutter/material.dart';
import 'package:salesflo_project/dio/data/di/service_locator.dart';
import 'package:salesflo_project/dio/data/models/new_user.dart';
import 'package:salesflo_project/dio/data/models/user_model.dart';
import 'package:salesflo_project/dio/data/repository/repository.dart';
import 'package:salesflo_project/ui/new_user.dart';
import 'package:salesflo_project/ui/widgets/add_user_button.dart';

class ShowUsers extends StatelessWidget {
  ShowUsers({Key? key}) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewUserPage(),
              ),
            );
            },
            child: const Text(
              'Show new users',
               style: TextStyle(
                color: Colors.white),))
        ],
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text('All users'),
      ),
    floatingActionButton: AddUserBtn(),
    body: FutureBuilder<List<UserModel>>(
      future: homeController.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          final error = snapshot.error;
          return Center(
            child: Text(
              "Error: " + error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                leading: user.avatar != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          user.avatar!,
                          width: 50,
                          height: 50,
                        ),
                      )
                    : null,
                title: Text(user.email ?? ''),
                subtitle: Text(user.firstName ?? ''),
              );
            },
          );
        }
        return Container();
      },
    ),
  );
  }
}
class HomeController {
  // --------------- Repository -------------
  final userRepository = getIt.get<UserRepository>();

  // -------------- Textfield Controller ---------------
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  void clearNameText() {
    nameController.clear();
  }
  void clearJobText() {
    jobController.clear();
  } 


  // -------------- Local Variables ---------------
  final List<NewUser> newUsers = [];

  // -------------- Methods ---------------

  Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    return users;
  }

  Future<NewUser> addNewUser() async {
    final newlyAddedUser = await userRepository.addNewUserRequested(
      nameController.text,
      jobController.text,
    );
    newUsers.add(newlyAddedUser);
    return newlyAddedUser;
  }

  Future<NewUser> updateUser(int id, String name, String job) async {
    final updatedUser = await userRepository.updateUserRequested(
      id,
      name,
      job,
    );
    newUsers[id] = updatedUser;
    return updatedUser;
  }

  Future<void> deleteNewUser(int id) async {
    await userRepository.deleteNewUserRequested(id);
    newUsers.removeAt(id);
  }
}
