import 'package:flutter/material.dart';

class ButtonSideBar extends StatefulWidget {
  final String title;
  final Function onTap;
  final IconData icon;
  final bool isIndex;
  const ButtonSideBar({
    Key? key,
    required this.title,
    required this.isIndex,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  _ButtonSideBarState createState() => _ButtonSideBarState();
}

class _ButtonSideBarState extends State<ButtonSideBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: widget.isIndex
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 60),
              Container(
                  width: 100,
                  child: Text(widget.title,
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }
}
