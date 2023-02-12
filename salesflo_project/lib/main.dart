import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/counter/bloc/counter_bloc.dart';
import 'package:salesflo_project/counter/views/counter_app.dart';
import 'package:salesflo_project/posts_cubit/cubit/posts_cubit.dart';
import 'package:salesflo_project/posts_cubit/views/posts_views.dart';
import 'package:salesflo_project/settings_cubit/cubit/setting_cubit.dart';
import 'package:salesflo_project/settings_cubit/cubit/setting_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(create: (context) => PostsCubit()..getPosts(), child: const PostsView(),)
      ],
      // consumed cubit for toggling the theme in Material App
      //whenever the theme get changed this can update its state
      // Here cubit uses two params and we also gave two parameters cubit and the state
      // bloc vs cubit : bloc uses two parameters event and state where as cubit also uses two parameters but event is replaced by cubit and state remains same

      //this is not the right way to 
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: ((context, state) {
          return MaterialApp(
            theme: state.theme,
            home: const CounterApp(),
      );
        }),)
      
    );
  }
}
  


