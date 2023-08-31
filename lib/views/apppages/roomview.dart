import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/addDeviceScreen.dart';

class RoomView extends StatefulWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  scanNearDevices() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: false,
        builder: (context) => NearDeviceScanning());
  }

  addNewDevice() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, height(context) * 0.55, 5,
          20), //here you can specify the location,
      items: [
        PopupMenuItem(
          value: 0,
          onTap: () {},
          child: Text("Ajouter Manuellement"),
        ),
        PopupMenuItem(
          value: 1,
          onTap: () {},
          child: Text("Lancer une recherche"),
        ),
      ],
    ).then((value) {
      if (value == 0) {
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500),
                type: PageTransitionType.bottomToTop,
                child: AddManuallyDeviceScreen(),
                childCurrent: RoomView()));
      } else if (value == 1) {
        scanNearDevices();
      } else
        () {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(color: Color(0xFF458df9)),
        child: Container(
          height: height(context),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: height(context) * 0.09,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Salon",
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
              height: height(context) * 0.04,
            ),
            Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.thermostat),
                                    Text(
                                      "25 C",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  "Température",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ]),
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.water_drop),
                                    Text(
                                      "50 %",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  "Humidité",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ]),
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.lightbulb),
                                    Text(
                                      "80 %",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  "Luminosité",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ]),
                        ),
                      ]),
                )),
            SizedBox(
              height: height(context) * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Consommation du jour",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "27,45 Kwh",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
              height: height(context) * 0.05,
              width: double.infinity,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    SizedBox(
                      height: height(context) * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.03,
                          vertical: height(context) * 0.01),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Appareils",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                addNewDevice();
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      
                        height: height(context)*0.4,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width(context) * 0.04,
                                        vertical: height(context) * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RoomDeviceItem(
                                          deviceName: "Ampoule",
                                          logo: Icons.lightbulb,
                                          state: true,
                                        ),
                                        RoomDeviceItem(
                                          deviceName: "AC",
                                          logo: Icons.ac_unit,
                                          state: false,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width(context) * 0.04,
                                        vertical: height(context) * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RoomDeviceItem(
                                          deviceName: "Wifi",
                                          logo: Icons.wifi,
                                          state: true,
                                        ),
                                        RoomDeviceItem(
                                          deviceName: "Smart TV",
                                          logo: Icons.tv,
                                          state: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            })),
                    Expanded(child: Container()),
                    Container(
                      width: width(context) * 0.91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Eteindre tous les appareils",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.01,
                    )
                  ])),
            ))
          ]),
        ),
      )),
    );
  }
}

class RoomDeviceItem extends StatefulWidget {
  final String deviceName;
  final IconData logo;
  final bool state;
  const RoomDeviceItem(
      {Key? key,
      required this.deviceName,
      required this.logo,
      required this.state})
      : super(key: key);

  @override
  State<RoomDeviceItem> createState() => _RoomDeviceItemState();
}

class _RoomDeviceItemState extends State<RoomDeviceItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      height: 125,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 170,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          widget.logo,
                          color: Color.fromARGB(255, 78, 77, 77),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.deviceName,
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 77, 77),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.state ? "On" : "Off",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          child: CircleAvatar(
                            backgroundColor: widget.state
                                ? Color.fromARGB(255, 100, 238, 105)
                                : Colors.grey,
                          ),
                        )
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}

class NearDeviceScanning extends StatefulWidget {
  const NearDeviceScanning({Key? key}) : super(key: key);

  @override
  State<NearDeviceScanning> createState() => _NearDeviceScanningState();
}

class _NearDeviceScanningState extends State<NearDeviceScanning> {
  int time = 30;
  void initState() {
    super.initState();
    scanTimeFinish();
  }

  Future<void> scanTimeFinish() async {
    for (int i = 0; time > 0; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        time = time - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.5,
      width: double.infinity,
      color: Color(0xFF265ed7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            width: 50,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: height(context) * 0.025),
          child: Text("Recherche d'appareils à proximité...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
        time == 0
            ? Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.03,
                    vertical: height(context) * 0.05),
                padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.02,
                    vertical: height(context) * 0.05),
                decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          size: 40,
                          color: Color.fromARGB(255, 197, 194, 194),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: height(context) * 0.03),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Aucun appareil trouvé.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Réessayez d'ajouter manuellement votre appareil",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text("Afficher l'aide",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15)))
                              ]),
                        )),
                        InkWell(
                            onTap: () {
                              setState(() {
                                time = 30;
                              });
                              scanTimeFinish();
                            },
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFf2f2f2),
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Réessayer",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ))
                      ]),
                ),
              )
            : Center(
                child: Stack(
                children: [
                  SpinKitRipple(
                    size: height(context) * 0.4,
                    duration: Duration(seconds: 5),
                    color: Color(0xFFf2f2f2),
                  ),
                  SpinKitRipple(
                    size: height(context) * 0.4,
                    duration: Duration(seconds: 6),
                    color: Color(0xFFf2f2f2),
                  ),
                  SpinKitRipple(
                    size: height(context) * 0.4,
                    duration: Duration(seconds: 7),
                    color: Color(0xFFf2f2f2),
                  )
                ],
              ))
      ]),
    );
  }
}
