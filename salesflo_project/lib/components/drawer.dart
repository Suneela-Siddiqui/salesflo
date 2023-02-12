import 'package:flutter/material.dart';
  
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.listTileItems,
    this.drawerBodyColor,
    this.userImagePath = " ",
    this.userName = " ",
    this.userLocation = " ",
    this.dividerThickness,
    this.dividerHeight,
    this.dividerColor,
    this.dividerEndIndent,
    this.dividerIndent,
    }) : super(key: key);

  final List<ListTileItem> listTileItems;
  final Color? drawerBodyColor;
  final String userImagePath;
  final String userName;
  final String userLocation;
  final double? dividerThickness;
  final double? dividerHeight;
  final Color? dividerColor;
  final double? dividerEndIndent;
  final double? dividerIndent;

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: drawerBodyColor ?? Theme.of(context).colorScheme.primary,
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(     
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                            userImagePath
                          )
                        ),
                      ),
                      const SizedBox(
                      height: 18,
                      ),
                      Text(
                          userName,
                          style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                      height: 8),
                      Text(
                          userLocation,
                          style:
                          const TextStyle(color: Colors.white, fontSize: 15),
                      )
                  ],
               ),
      const SizedBox(height: 18),
      Divider(
      thickness: dividerThickness ?? 1.5,
      height: dividerHeight ?? 0.5,
      color: dividerColor ?? Colors.white54,
      endIndent: dividerEndIndent ?? 28,
      indent: dividerEndIndent ?? 28,
      ),
      const SizedBox(height: 18),
      Expanded(
      child: ListView.builder(
      itemCount: listTileItems.length,
      itemBuilder: (context, index) {
      return DrawerTile(listTileItem:
      listTileItems[index]);
                },
              ),
            )
          ],
        ),
      ))
    );
  }
}

class DrawerTile extends StatelessWidget {
const DrawerTile({
    Key? key,
    required this.listTileItem,
    }) : super(key: key);
  final ListTileItem listTileItem;
  @override
  Widget build(BuildContext context) {
     return ListTile(
        horizontalTitleGap: 0,
        onTap: listTileItem.onTap,
        leading: Icon(
        listTileItem.icon ?? Icons.accessibility,
        color: listTileItem.iconColor ?? Colors.white,
        ),
        title: Text(listTileItem.title.toString(),
        style: TextStyle(
        color: listTileItem.titleTextColor ?? Colors.white,
        fontSize: listTileItem.titleTextfontSize ?? 15,
        fontFamily: 'PTSerif-Bold',
        letterSpacing: 0.5)),
      );
    }
  }

class ListTileItem {
    final String title;
    final IconData? icon;
    final Function()? onTap;
    final Color? iconColor;
    final Color? titleTextColor;
    final double? titleTextfontSize;
ListTileItem(
    {
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.titleTextColor,
    this.titleTextfontSize});
}
