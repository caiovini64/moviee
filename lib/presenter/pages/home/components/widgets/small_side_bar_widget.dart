import 'package:flutter/material.dart';

class SmallSideBarWidget extends StatelessWidget {
  const SmallSideBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Just Move it',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
