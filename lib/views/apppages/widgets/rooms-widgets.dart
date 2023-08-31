import "package:flutter/material.dart";
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/homescreen.dart';
import 'package:silma_connect/views/apppages/roomview.dart';

class RoomBlock extends StatefulWidget {
  final bool isTry;
  const RoomBlock({Key? key, required this.isTry}) : super(key: key);

  @override
  State<RoomBlock> createState() => _RoomBlockState();
}

class _RoomBlockState extends State<RoomBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, bottom: 12),
        height: 227,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return RoomItem(
                isTry: widget.isTry,
                name: "Pièce",
                logo: "assets/images/avatar.png",
              );
            }));
  }
}

class RoomItem extends StatefulWidget {
  final String name;
  final String logo;
  final bool isTry;
  const RoomItem(
      {Key? key, required this.name, required this.logo, required this.isTry})
      : super(key: key);

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(seconds: 1),
                reverseDuration: Duration(seconds: 1),
                type: PageTransitionType.theme,
                child: RoomView(),
                childCurrent: Homescreen(isTry: widget.isTry,)));
      },
      child: Container(
        width: 185,
        margin: EdgeInsets.only(right: width(context) * 0.04),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/salon.png",
                scale: 3.8,
              ),
              Text(
                "Salon",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 43, 42, 40),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "4 appareils",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF64605b),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
            ]),
      ),
    );
  }
}
