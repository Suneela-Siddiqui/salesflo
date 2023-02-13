import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/counter/bloc/counter_bloc.dart';
import 'package:salesflo_project/posts_cubit/views/posts_views.dart';
import 'package:salesflo_project/settings_cubit/views/setting_page.dart';
import 'package:salesflo_project/ui/list_users.dart';

import '../../components/drawer.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({
    Key? key,
    }) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
   final counterBloc = context.read<CounterBloc>();
 //  final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      drawer: AppDrawer(
        userName: 'Emilia Clarke',
        userImagePath: 'https://i.pinimg.com/736x/0a/53/c3/0a53c3bbe2f56a1ddac34ea04a26be98.jpg',
        userLocation: 'Berlin, Germany',
        drawerBodyColor: Colors.indigo,
        listTileItems: [
          ListTileItem(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
            },
            title: 'Change Theme',
            icon: Icons.circle_outlined),
          ListTileItem(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PostsView()));
            },
            title: 'View all Posts',
            icon: Icons.circle_outlined),
             ListTileItem(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShowUsers()));
            },
            title: 'Show Users',
            icon: Icons.circle_outlined),

        ]),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text('Welcome Jane!'),
      ),

      body: Center(
        child: BlocBuilder<CounterBloc, int> (
          builder: (context, state) {
            return Text(
              '$state',
         // context.watch<CounterBloc>().state.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 300,
              color: Colors.amber[300])
          );
          },
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             FloatingActionButton(
               onPressed: () {
                 counterBloc.add(Increment());
                  // counterBloc.add(CounterEvent.Increment);
               },
               heroTag: 1,
               backgroundColor: Colors.indigo,
               child: const Icon(Icons.add),
               ),
              const SizedBox(
                   width: 15,
                 ),
               FloatingActionButton(
               onPressed: () {
                   counterBloc.add(Decrement());
               },
               heroTag: 2,
               backgroundColor: Colors.indigo,
               child: const Icon(Icons.remove),
               ),
              const SizedBox(
                   width: 15,
                 ),
               FloatingActionButton(
               onPressed: () {
                  counterBloc.add(Reset());
               },
               heroTag: 3,
               backgroundColor: Colors.indigo,
               child: const Icon(Icons.loop),
               ),
              const SizedBox(
                   width: 15,
                 ),
           ],
         ),
      ),
    );
  }
}


