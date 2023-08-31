
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/addDeviceScreen.dart';
import 'package:silma_connect/views/apppages/createSceneScreen.dart';
import 'package:silma_connect/views/apppages/profilScreen.dart';
import 'package:silma_connect/views/apppages/widgets/rooms-widgets.dart';
import 'package:silma_connect/views/apppages/widgets/scenes-widgets.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.isTry}) : super(key: key);
  final bool isTry;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> devices = [];
  @override
  Widget build(BuildContext context) {
    return devices.length == 0
        ? HomeScreenEmpty(
            isTry: widget.isTry,
          )
        : Scaffold(
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  color: Color(0xFF458df9),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height(context) * 0.09,
                        ),
                        Container(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width(context) * 0.03),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.menu,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Ma maison",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.notifications,
                                            size: 30,
                                            color: Colors.white,
                                          )
                                        ]),
                                  ),
                                  SizedBox(
                                    height: height(context) * 0.023,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width(context) * 0.06),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.flash_on_rounded,
                                                      size: 35,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Ligthing",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ]),
                                          ),
                                          Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "19 C",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 27),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Temp Outside",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ]),
                                          ),
                                          Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "25 C",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 27),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Temp Indoor",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ]),
                                          )
                                        ]),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Column(children: [
                            SizedBox(
                              height: height(context) * 0.02,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width(context) * 0.05),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width(context) * 0.02,
                                    vertical: height(context) * 0.02),
                                decoration: BoxDecoration(
                                    color: Color(0xFFf2f2f2),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.energy_savings_leaf,
                                                  size: 27,
                                                  color: Color(0xFF716e6b),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "29,5 KWh",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "Consommation du jour",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                        SizedBox(
                                          width: width(context) * 0.02,
                                        ),
                                        Container(
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.energy_savings_leaf,
                                                  size: 27,
                                                  color: Color(0xFF716e6b),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "303 KWh",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "Consommation du mois",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ]),
                                )),
                            SizedBox(
                              height: height(context) * 0.03,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFf2f2f2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35))),
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width(context) * 0.05,
                                      vertical: height(context) * 0.04),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Scènes",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            duration: Duration(
                                                                seconds: 1),
                                                            reverseDuration:
                                                                Duration(
                                                                    seconds: 1),
                                                            type:
                                                                PageTransitionType
                                                                    .theme,
                                                            child:
                                                                CreateSceneScreen(),
                                                            childCurrent:
                                                                Homescreen(
                                                              isTry:
                                                                  widget.isTry,
                                                            )));
                                                  },
                                                  child: Icon(Icons.add),
                                                )
                                              ]),
                                        ),
                                        SizedBox(
                                          height: height(context) * 0.015,
                                        ),
                                        SceneBlock(),
                                        SizedBox(
                                          height: height(context) * 0.015,
                                        ),
                                        Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pièces",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(Icons.add)
                                              ]),
                                        ),
                                        SizedBox(
                                          height: height(context) * 0.02,
                                        ),
                                        RoomBlock(
                                          isTry: widget.isTry,
                                        )
                                      ])),
                            )
                          ]),
                        ),
                      ]),
                )),
          );
  }
}

class HomeScreenEmpty extends StatefulWidget {

  const HomeScreenEmpty(
      {Key? key,
      required this.isTry,
    })
      : super(key: key);
  final bool isTry;

  @override
  State<HomeScreenEmpty> createState() => _HomeScreenEmptyState();
}

class _HomeScreenEmptyState extends State<HomeScreenEmpty> {
  void aboutAutorizationBottomModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: false,
        builder: (context) => AboutAutorization());
  }

  addNewThings() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, height(context) * 0.15, 5,
          20), //here you can specify the location,
      items: [
        PopupMenuItem(
          value: 0,
          onTap: () {},
          child: Container(
              child: Row(
            children: [
              Icon(Icons.power),
              SizedBox(
                width: 10,
              ),
              Text("Ajouter un appareil")
            ],
          )),
        ),
        PopupMenuItem(
          value: 1,
          onTap: () {},
          child: Container(
              child: Row(
            children: [
              Icon(Icons.touch_app),
              SizedBox(
                width: 10,
              ),
              Text("Créer une scène")
            ],
          )),
        ),
      ],
    ).then((value) {
      if (value == 0) {
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(seconds: 1),
                reverseDuration: Duration(seconds: 1),
                type: PageTransitionType.theme,
                child: AddDeviceScreen(),
                childCurrent: HomeScreenEmpty(
                  isTry: widget.isTry,
                )));

        aboutAutorizationBottomModal(context);
      } else if (value == 1) {
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(seconds: 1),
                reverseDuration: Duration(seconds: 1),
                type: PageTransitionType.theme,
                child: CreateSceneScreen(),
                childCurrent: HomeScreenEmpty(
                  isTry: widget.isTry,
                )));
      } else
        () {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height(context) * 0.09,
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (widget.isTry) {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        duration: Duration(seconds: 1),
                                        reverseDuration: Duration(seconds: 1),
                                        type: PageTransitionType.theme,
                                        child: CompleteAccountInfoScreen(),
                                        childCurrent: HomeScreenEmpty(
                                          isTry: true,
                                        )));
                              } else {}
                            },
                            child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 216, 216, 216),
                                child: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.grey,
                                )),
                          ),
                          Text(
                            "Ma Maison",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              addNewThings();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: height(context) * 0.023,
                  ),
                  Center(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: height(context) * 0.1),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: height(context) * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/empty-device.png"))),
                            ),
                            Text(
                              "Aucun appareil",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: height(context) * 0.03,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width(context) * 0.06),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(seconds: 1),
                                          reverseDuration: Duration(seconds: 1),
                                          type: PageTransitionType.theme,
                                          child: AddDeviceScreen(),
                                          childCurrent: HomeScreenEmpty(
                                            isTry: widget.isTry,
                                          )));

                                  aboutAutorizationBottomModal(context);
                                },
                                child: Text(
                                  "Ajouter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )
                ]),
          )),
    );
  }
}
