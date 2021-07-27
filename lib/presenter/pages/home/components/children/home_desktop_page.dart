import 'package:flutter/material.dart';
import 'package:moviee/presenter/pages/home/components/widgets/side_bar_widget.dart';
import 'package:moviee/presenter/pages/home/components/widgets/widgets.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

class HomeDesktopPage extends StatelessWidget {
  final HomeController controller;
  const HomeDesktopPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SideBarWidget(controller: controller),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      padding: EdgeInsets.only(left: 10),
                      width: 500,
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Color(0xffC7D5E0)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListMoviesWidget(controller.popularMoviesList),
              ListMoviesWidget(controller.popularMoviesList),
            ],
          ),
        ],
      ),
    );
  }
}
