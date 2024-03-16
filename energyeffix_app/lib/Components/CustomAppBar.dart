import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar;
  final String title;
  const CustomAppBar({required this.appBar, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Color(0xff0071aa),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
            tooltip: "Top Navigation Bar Menu",
            iconSize: 35,
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, EeHome.routeName);
            },
            child: Image.asset(
              'assets/images/energy_effix_logo_full_h.png',
              width: 150,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.add_alert),
          color: Colors.white,
          tooltip: "Top Navigation Bar Notification Button",
          iconSize: 25,
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.account_circle),
          color: Colors.white,
          tooltip: "Top Navigation Bar Profile Icon",
          iconSize: 25,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                tooltip: "Back Button",
                iconSize: 35,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight
        (appBar.preferredSize.height);
}