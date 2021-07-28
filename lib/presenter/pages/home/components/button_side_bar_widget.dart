import 'package:flutter/material.dart';

class ButtonSideBar extends StatefulWidget {
  final String title;
  final Function onTap;
  final IconData icon;
  final bool isIndex;
  final bool isOpen;
  const ButtonSideBar({
    Key? key,
    required this.title,
    required this.isIndex,
    required this.icon,
    required this.onTap,
    required this.isOpen,
  }) : super(key: key);

  @override
  _ButtonSideBarState createState() => _ButtonSideBarState();
}

class _ButtonSideBarState extends State<ButtonSideBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: 10),
          color: widget.isIndex
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(widget.icon),
                color: Colors.white,
                onPressed: () => widget.onTap(),
              ),
              Visibility(
                visible: widget.isOpen,
                child: SizedBox(width: 60),
              ),
              Visibility(
                visible: widget.isOpen,
                child: Container(
                  width: 100,
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
