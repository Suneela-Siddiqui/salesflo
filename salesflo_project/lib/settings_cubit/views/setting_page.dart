import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/settings_cubit/cubit/setting_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super (key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:  const Text ('Change your Theme!'),
        centerTitle: true,  
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              // that's it, only you have to call the method
              final cubit = context.read<SettingCubit>();
              cubit.toggleTheme();
            },
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.indigo,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)
              ),
              minimumSize: const Size(200, 60)
              
            ),
            child: Row(
              children: [
               const Icon(
                  Icons.color_lens_outlined
                ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2
                ),
              const Text('Change Theme', 
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20
                  ),
                )
              ],
            )),
        )),
    );
  }


}