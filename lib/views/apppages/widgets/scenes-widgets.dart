import "package:flutter/material.dart";
import 'package:silma_connect/constant.dart';

class SceneBlock extends StatefulWidget {
  const SceneBlock({
    Key? key,
  }) : super(key: key);

  @override
  State<SceneBlock> createState() => _SceneBlockState();
}

class _SceneBlockState extends State<SceneBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SceneItem(
                name: "Scène",
                logo: "assets/images/home.png",
              );
            }));
  }
}

class SceneItem extends StatefulWidget {
  final String name;
  final String logo;
  const SceneItem({Key? key, required this.name, required this.logo})
      : super(key: key);

  @override
  State<SceneItem> createState() => _SceneItemState();
}

class _SceneItemState extends State<SceneItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: 115,
        margin: EdgeInsets.only(right: width(context) * 0.04),
        decoration: BoxDecoration(
            color:  Color(0xFF458df9) ,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(Icons.home,size: 50,color:Colors.white,),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}
