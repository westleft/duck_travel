import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.only(left: 8),
        child: InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
          child: Image.network('https://i.imgur.com/5KxFSQM.png'),
        ),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false
    );
  }
}
