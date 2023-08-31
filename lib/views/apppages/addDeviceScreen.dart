import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:silma_connect/constant.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  // This member variable will be used for tracking
// the Bluetooth device connection state

  bool timeOut = false;
  var top= Random().nextDouble()*256;
  var left=Random().nextDouble()*256;
  int? _deviceState;
  
  void initState(){
    super.initState();

    print("top: "+top.toString());
    print("left: "+left.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: height(context) * 0.09,
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              "Ajouter un appareil",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(seconds: 1),
                          reverseDuration: Duration(seconds: 1),
                          type: PageTransitionType.theme,
                          child: ScanScreen(),
                          childCurrent: AddDeviceScreen()));

                  aboutCameraAutorizationBottomModal(context);
                },
                child: Icon(Icons.center_focus_weak))
          ]),
        ),
        SizedBox(
          height: height(context) * 0.023,
        ),
        Container(
          child: Row(
            children: [
              timeOut
                  ? Icon(Icons.info, size: 35, color: Colors.grey)
                  : SpinKitRipple(
                      size: 35,
                      duration: Duration(seconds: 2),
                      color: Color.fromARGB(255, 167, 181, 235),
                    ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177)),
                        text:
                            "Recherche des appareils à proximité. Assurez-vous que votre appareil est en ",
                        children: [
                      TextSpan(
                          text: "mode de couplage",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(seconds: 1),
                                    reverseDuration: Duration(seconds: 1),
                                    type: PageTransitionType.theme,
                                    child: HelpForCouplage(),
                                    childCurrent: AddDeviceScreen())),
                          style: TextStyle(color: Colors.blue))
                    ])),
              )
            ],
          ),
        ),
        SizedBox(
          height: height(context) * 0.023,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.02,
                vertical: height(context) * 0.02),
            decoration: BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activer le Wi-Fi",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                ),
                Container(
                  child: Stack(children: [
                    Icon(
                      Icons.wifi,
                      size: 30,
                    ),
                    Positioned(
                        right: width(context) * 0.01,
                        child: Container(
                          height: 15,
                          width: 15,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text("!"),
                          ),
                        ))
                  ]),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.023,
        ),
        true
            ? InkWell(
                onTap: () {
                  aboutBluetoothAutorizationBottomModal(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.02,
                      vertical: height(context) * 0.02),
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Activer le Bluetooth",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w200),
                      ),
                      Container(
                        child: Stack(children: [
                          Icon(
                            Icons.bluetooth,
                            size: 30,
                          ),
                          Positioned(
                              right: width(context) * 0.01,
                              child: Container(
                                height: 15,
                                width: 15,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Text("!"),
                                ),
                              ))
                        ]),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        SizedBox(
          height: height(context) * 0.023,
        ),
        timeOut
            ? Container(
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
                                timeOut = false;
                              });
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
            : Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF265ed7),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: Stack(
                      children: [
                        SpinKitRipple(
                          size: height(context) * 0.8,
                          duration: Duration(seconds: 5),
                          color: Color(0xFFf2f2f2),
                        ),
                        SpinKitRipple(
                          size: height(context) * 0.8,
                          duration: Duration(seconds: 6),
                          color: Color(0xFFf2f2f2),
                        ),
                        SpinKitRipple(
                          size: height(context) * 0.8,
                          duration: Duration(seconds: 7),
                          color: Color(0xFFf2f2f2),
                        ),
                        Center(
                          child: Container(
                              height: 10,
                              width: 10,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                              )),
                        ),
                        Positioned(
                            top: top,
                            left: left,
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                      child:Image.asset("assets/images/devices/light-source.png")
                                ),
                                SizedBox(height:7),
                                Text("Source de lumière",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ))
                      ],
                    )))),
        timeOut
            ? Expanded(
                child: Container(
                width: double.infinity,
              ))
            : SizedBox(),
        SizedBox(
          height: height(context) * 0.01,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      type: PageTransitionType.bottomToTop,
                      child: AddManuallyDeviceScreen(),
                      childCurrent: AddDeviceScreen()));
            },
            child: Center(
                child: TextButton(
              onPressed: null,
              child: Text(
                "Ajouter manuellement",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )))
      ]),
    ));
  }
}

class AboutAutorization extends StatefulWidget {
  const AboutAutorization({Key? key}) : super(key: key);

  @override
  State<AboutAutorization> createState() => _AboutAutorizationState();
}

class _AboutAutorizationState extends State<AboutAutorization> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: height(context) * 0.7,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: width(context) * 0.05),
                child: Text(
                  "Fermer",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 17),
                ),
              ),
            ),
            Container(),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Text(
              "L'application SILMA-CONNECT demande les autorisations d'accès suivantes.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Text(
            "La sécurité de la confidentialité de vos informations personnelles est garantie lorsque les autorisations suivantes sont accordées.",
            style: TextStyle(
                color: Color.fromARGB(255, 177, 177, 177), fontSize: 13),
          ),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.02,
                vertical: height(context) * 0.02),
            decoration: BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.location_on,
                                      size: 20, color: Colors.white))),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Localisation",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Recherchez des emplacements, ajoutez des appareils, obtenez une liste de réseaux Wi-Fi et effectuez une automatisation de scène.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontSize: 15),
                      )
                    ],
                  ))),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 139, 139, 139).withOpacity(0.5),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: height(context) * 0.07,
        ),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                width: width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Continuer",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )),
          ),
        )
      ]),
    );
  }
}

class HelpForCouplage extends StatefulWidget {
  const HelpForCouplage({Key? key}) : super(key: key);

  @override
  State<HelpForCouplage> createState() => _HelpForCouplageState();
}

class _HelpForCouplageState extends State<HelpForCouplage> {
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
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            "How do I use \"Auto Scan\"?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                          Container()
                        ]),
                  ),
                  SizedBox(
                    height: height(context) * 0.023,
                  ),
                  Text(
                    "Dear user, you can search for the device after resetting the device in the following way (the details are subject to the product manual) :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "1.",
                        children: [
                          TextSpan(
                              text: "Bluetooth device: ",
                              children: [],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          TextSpan(
                              text:
                                  "First, make sure that the device is powered off for more than 10  seconds, then power on the device, and then press and hold the reset button on the device for about 5 seconds until the indicator light of the device starts to flash and the device enters the pairing mode. At this time enter the \"Add Device\" page and wait for searching.",
                              children: [],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 177, 177, 177),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16)),
                        ],
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: height(context) * 0.015,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "2.",
                        children: [
                          TextSpan(
                              text: "Zigbee device: ",
                              children: [],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          TextSpan(
                              text:
                                  "First, if there are multiple Zigbee gateways in your home, please select the gateway that needs to add sub-devices and ensure that it is online, then power off the sub-device for more than 10 seconds, then power on the sub-device, nd then press and hold the reset button on the device for about 5 seconds until the indicator light of the device starts to flash and the device enters the pairing mode. At this time, enter the \"Add Device\" page and wait for scanning.",
                              children: [],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 177, 177, 177),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16)),
                        ],
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: height(context) * 0.015,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "3.",
                        children: [
                          TextSpan(
                              text: "Wired devices: ",
                              children: [],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          TextSpan(
                              text:
                                  "First, make sure that the device is powered off for more than 10  seconds, then power on the device and connect the device to the router so that the phone and the device are the same LAN. press and hold the reset button on the device for about 5 seconds until the indicator light of the device starts to flash and the device enters the pairing mode. At this time, enter the \"Add Device\" page and wait for searching.",
                              children: [],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 177, 177, 177),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16)),
                        ],
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Text(
                    "For lighting devices, the reset method is to switch the powerof the device three times (on-off-on-off-on) (2~4 between each on and off).",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height(context) * 0.015,
                  ),
                  Text(
                    "If you don't have the above types of equipment, you can also try to add the device manually.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: height(context) * 0.015,
                  ),
                ]),
          )),
    );
  }
}

class AboutBluetoothAutorization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: width(context) * 0.05),
                child: Icon(Icons.close,
                    color: Colors.grey.withOpacity(0.8), size: 30),
              ),
            ),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Row(
            children: [
              Container(
                  child: Stack(children: [
                Container(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.bluetooth,
                      size: 27,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    top: height(context) * 0.033,
                    left: width(context) * 0.06,
                    child: Container(
                      height: 16,
                      width: 16,
                      child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child:
                              Icon(Icons.check, color: Colors.white, size: 15)),
                    ))
              ])),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Il est conseillé d'activer le Bluetooth.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: height(context) * 0.01,
                  ),
                  Text(
                    "Activer le Bluetooth pour faciliter l'ajout de certains appareils.",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color.fromARGB(255, 177, 177, 177),
                        fontSize: 14),
                  )
                ],
              ))
            ],
          ),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          height: 1,
          width: double.infinity,
          color: Color.fromARGB(255, 177, 177, 177),
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Autoriser le\nBluetooth",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Activé",
                            style: TextStyle(
                                color: Color.fromARGB(255, 177, 177, 177),
                                fontSize: 16)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.check_rounded,
                            color: Color.fromARGB(255, 177, 177, 177), size: 20)
                      ],
                    )
                  ]),
            ),
            Container(
              height: height(context) * 0.15,
              width: width(context) * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/bluetooth_autorization.png"))),
            )
          ]),
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          height: 1,
          width: double.infinity,
          color: Color.fromARGB(255, 177, 177, 177),
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Activer le\nBluetooth",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text("Allumer maintenant",
                          style: TextStyle(color: Colors.blue, fontSize: 14)),
                    )
                  ]),
            ),
            Container(
              height: height(context) * 0.15,
              width: width(context) * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bluetooth_enable.png"))),
            )
          ]),
        ),
      ]),
    );
  }
}

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      //do something
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}

class AboutCameraAutorization extends StatefulWidget {
  const AboutCameraAutorization({Key? key}) : super(key: key);

  @override
  State<AboutCameraAutorization> createState() =>
      _AboutCameraAutorizationState();
}

class _AboutCameraAutorizationState extends State<AboutCameraAutorization> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: height(context) * 0.7,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: width(context) * 0.05),
                child: Text(
                  "Fermer",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 17),
                ),
              ),
            ),
            Container(),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Text(
              "L'application SILMA-CONNECT demande les autorisations d'accès suivantes.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Text(
            "La sécurité de la confidentialité de vos informations personnelles est garantie lorsque les autorisations suivantes sont accordées.",
            style: TextStyle(
                color: Color.fromARGB(255, 177, 177, 177), fontSize: 13),
          ),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.02,
                vertical: height(context) * 0.02),
            decoration: BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.camera_alt,
                                      size: 20, color: Colors.white))),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Caméra",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Scannez les codes QR, personnalisez les images, et plus encore.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontSize: 15),
                      )
                    ],
                  ))),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 139, 139, 139).withOpacity(0.5),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: height(context) * 0.07,
        ),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                width: width(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Continuer",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )),
          ),
        )
      ]),
    );
  }
}

class AddManuallyDeviceScreen extends StatefulWidget {
  const AddManuallyDeviceScreen({Key? key}) : super(key: key);

  @override
  State<AddManuallyDeviceScreen> createState() =>
      _AddManuallyDeviceScreenState();
}

class _AddManuallyDeviceScreenState extends State<AddManuallyDeviceScreen> {
  int catId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: height(context) * 0.09,
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              "Ajouter manuellement",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.track_changes)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(seconds: 1),
                          reverseDuration: Duration(seconds: 1),
                          type: PageTransitionType.theme,
                          child: ScanScreen(),
                          childCurrent: AddDeviceScreen()));

                  aboutCameraAutorizationBottomModal(context);
                },
                child: Icon(Icons.center_focus_weak))
          ]),
        ),
        SizedBox(
          height: height(context) * 0.07,
        ),
        Container(
          child: Row(children: [
            Container(
              height: height(context) * 0.75,
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 1;
                              });
                            },
                            child: Text(
                              "Electrique",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 1
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 2;
                              });
                            },
                            child: Text(
                              "Eclairage",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 2
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 3;
                              });
                            },
                            child: Text(
                              "Sécurité et\ncapteurs",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 3
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 4;
                              });
                            },
                            child: Text(
                              "Gros\nappareils...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 4
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 5;
                              });
                            },
                            child: Text(
                              "Petits\nappareils...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 5
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 6;
                              });
                            },
                            child: Text(
                              "Appareil\nélectromé...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 6
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 7;
                              });
                            },
                            child: Text(
                              "Santé et\nexercice",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 7
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 8;
                              });
                            },
                            child: Text(
                              "Caméra et\nSerrure",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 8
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 9;
                              });
                            },
                            child: Text(
                              "Contrôle\nde la pass...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 9
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 10;
                              });
                            },
                            child: Text(
                              "Voyage en\nplein air",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 10
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 11;
                              });
                            },
                            child: Text(
                              "Energy",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 11
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 12;
                              });
                            },
                            child: Text(
                              "Entertainm\nent",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 12
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 13;
                              });
                            },
                            child: Text(
                              "Industry &\nAgriculture",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 13
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: height(context) * 0.05,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                catId = 14;
                              });
                            },
                            child: Text(
                              "Autre",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: catId == 14
                                      ? Colors.black
                                      : Color.fromARGB(255, 175, 174, 174),
                                  fontWeight: FontWeight.bold),
                            )),
                      ])),
            ),
            SizedBox(width: width(context) * 0.03),
            Expanded(
                child: Container(
                    height: height(context) * 0.75,
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: catId == 1
                            ? ElectricDeviceTypeList()
                            : (catId == 2
                                ? EclairageDeviceTypeList()
                                : (catId == 3
                                    ? SecurityAndCaptorsDeviceTypeList()
                                    : (catId == 4
                                        ? BigDeviceTypeList()
                                        : (catId == 5
                                            ? SmallDeviceTypeList()
                                            : (catId == 6
                                                ? DomesticDeviceTypeList()
                                                : (catId == 7
                                                    ? HealthDeviceTypeList()
                                                    : (catId == 8
                                                        ? CameraAndLockDeviceTypeList()
                                                        : (catId == 9
                                                            ? ControlDeviceTypeList()
                                                            : (catId == 10
                                                                ? TravelDeviceTypeList()
                                                                : (catId == 11
                                                                    ? EnergyDeviceTypeList()
                                                                    : (catId ==
                                                                            12
                                                                        ? EntertainmentDeviceTypeList()
                                                                        : (catId ==
                                                                                13
                                                                            ? IndustryAndAgricultureDeviceTypeList()
                                                                            : (catId == 14
                                                                                ? OtherDeviceTypeList()
                                                                                : Container()))))))))))))))))
          ]),
        )
      ]),
    ));
  }
}

class DeviceItem extends StatelessWidget {
  final String deviceName;
  final String deviceImg;

  const DeviceItem(
      {Key? key, required this.deviceName, required this.deviceImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/devices/${deviceImg}.png")),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        SizedBox(height: 20),
        Text(
          deviceName,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 13),
        )
      ],
    ));
  }
}

class ElectricDeviceTypeList extends StatelessWidget {
  const ElectricDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Prise",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Prise\n(BLE+Wi-Fi)",
              deviceImg: "prise",
            ),
            DeviceItem(
              deviceName: "Prise\n(Wi-Fi)",
              deviceImg: "prise",
            ),
            DeviceItem(
              deviceName: "Prise\n(Zigbee)",
              deviceImg: "prise",
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Prise\n(BLE)",
              deviceImg: "prise",
            ),
            DeviceItem(
              deviceName: "Prise\n(NB-IoT)",
              deviceImg: "prise",
            ),
            DeviceItem(
              deviceName: "Prise\n(autres)",
              deviceImg: "prise",
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Multiprise",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Multiprise\n(BLE+Wi-Fi)",
              deviceImg: "multiprise",
            ),
            DeviceItem(
                deviceName: "Multiprise\n(Wi-Fi)", deviceImg: "multiprise"),
            DeviceItem(
                deviceName: "Multiprise\n(Zigbee)", deviceImg: "multiprise")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Multiprise\n(autres)", deviceImg: "multiprise"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Interrupteur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\n(BLE+Wi-Fi)",
                deviceImg: "interrupteur"),
            DeviceItem(
                deviceName: "Interrupteur\n(Wi-Fi)", deviceImg: "interrupteur"),
            DeviceItem(
                deviceName: "Interrupteur\n(Zigbee)", deviceImg: "interrupteur")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\n(BLE)", deviceImg: "interrupteur"),
            DeviceItem(
                deviceName: "Interrupteur\n(autres)",
                deviceImg: "interrupteur"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Interrupteur de gradateur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\nde gradateur\n(Wi-Fi)",
                deviceImg: "interrupteur-gradateur"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Interrupteur à rideaux",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\nà rideaux\n(BLE+Wi-Fi)",
                deviceImg: "interrupteur-rideau"),
            DeviceItem(
                deviceName: "Interrupteur\nà rideaux\n(Wi-Fi)",
                deviceImg: "interrupteur-rideau"),
            DeviceItem(
                deviceName: "Interrupteur\nà rideaux\n(Zigbee)",
                deviceImg: "interrupteur-rideau")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\nà rideaux\n(autres)",
                deviceImg: "interrupteur-rideau"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Interrupteur de ventilateur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\nde ventilateur\n(BLE+Wi-Fi)",
                deviceImg: "interrupteur-ventilateur"),
            DeviceItem(
                deviceName: "Interrupteur\nde ventilateur\n(Wi-Fi)",
                deviceImg: "interrupteur-ventilateur"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Changement de scénario",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Commutateur\nde scène\n(BLE+Wi-Fi)",
                deviceImg: "commutateur-scene"),
            DeviceItem(
                deviceName: "Changement\nde scénario\n(Wi-Fi)",
                deviceImg: "changement-scenario"),
            DeviceItem(
                deviceName: "Changement\nde scénario\n(Zigbee)",
                deviceImg: "changement-scenario")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Changement\nde scénario\n(autres)",
                deviceImg: "changement-scenario"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Commutateur sans fil",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Commutateur\nsans fil\n(BLE+Wi-Fi)",
                deviceImg: "interrupteur"),
            DeviceItem(
                deviceName: "Commutateur\nsans fil\n(Wi-Fi)",
                deviceImg: "interrupteur"),
            DeviceItem(
                deviceName: "Commutateur\nsans fil\n(Zigbee)",
                deviceImg: "interrupteur")
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Interrupteur de carte",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Interrupteur\nde carte\n(Zigbee)",
                deviceImg: "interrupteur-carte"),
            DeviceItem(
                deviceName: "Interrupteur\nde carte\n(BLE)",
                deviceImg: "interrupteur-carte"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "sonette de porte sans fil",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Sonette de\nporte sans fil\n(Wi-Fi)",
                deviceImg: "sonette-sans-fil"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Module d'interrupteurs",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Briseur\n(BLE+Wi-Fi)", deviceImg: "disjoncteur"),
            DeviceItem(
                deviceName: "Disjoncteur\n(Wi-Fi)", deviceImg: "disjoncteur"),
            DeviceItem(
                deviceName: "Disjoncteur\n(Zigbee)", deviceImg: "disjoncteur")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Disjoncteur\n(français)",
                deviceImg: "disjoncteur"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "adaptateur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "adaptateur\nPD\n(Wi-Fi)", deviceImg: "adaptateur"),
            DeviceItem(
                deviceName: "adaptateur\nPD\n(BLE)", deviceImg: "adaptateur"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Ouvre-porte de garage",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Ouverture\nde garage\n(BLE+Wi-Fi)",
                deviceImg: "ouverture-garage"),
            DeviceItem(
                deviceName: "Ouverture\nde garage\n(Wi-Fi)",
                deviceImg: "ouverture-garage"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Chauffage anti-moustique",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Chauffage an\nti-moustique\n(Wi-Fi)",
                deviceImg: "chauffage-anti-moustique"),
            DeviceItem(
                deviceName: "Chauffage an\nti-moustique\n(BLE)",
                deviceImg: "chauffage-anti-moustique"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Scénario avec prise de lumière",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Scénario\navec prise de\nlumière\n(Wi-Fi)",
                deviceImg: "scenario-prise-lumiere"),
            DeviceItem(
                deviceName: "Scénario\navec prise de\nlumière\n(autres)",
                deviceImg: "scenario-prise-lumiere"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Accoupleur de climatiseur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Climatiseur\nportable\n(Wi-Fi)",
                deviceImg: "climatiseur"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Pompes à eau",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Pompes à\neau\n(BLE+Wi-Fi)",
                deviceImg: "pompe-eau"),
            DeviceItem(
                deviceName: "Pompes à\neau\n(4G)", deviceImg: "pompe-eau"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Outil",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(deviceName: "Batterie\n(BLE)", deviceImg: "batterie"),
          ],
        )),
      ],
    );
  }
}

class EclairageDeviceTypeList extends StatelessWidget {
  const EclairageDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Source de lumière",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Source de\nlumière\n(BLE+Wi-Fi)",
              deviceImg: "light-source",
            ),
            DeviceItem(
              deviceName: "Source de\nlumière\n(Wi-Fi)",
              deviceImg: "light-source",
            ),
            DeviceItem(
              deviceName: "Source de\nlumière\n(Zigbee)",
              deviceImg: "light-source",
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Source de\nlumière\n(BLE)",
              deviceImg: "light-source",
            ),
            DeviceItem(
              deviceName: "Source de\nlumière\n(autres)",
              deviceImg: "light-source",
            ),
            EmptyDeviceItem()
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Lumières de bande",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Lumières de\nde bande\n(BLE+Wi-Fi)",
              deviceImg: "band-light",
            ),
            DeviceItem(
                deviceName: "Lumières de\nde bande\n(Wi-Fi)",
                deviceImg: "band-light"),
            DeviceItem(
                deviceName: "Lumières de\nde bande\n(BLE)",
                deviceImg: "band-light")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Lumières de\nde bande\n(Zigbee)",
                deviceImg: "band-light"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Eclairage ambiant",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Eclairage\nambiant\n(BLE+Wi-Fi)",
                deviceImg: "atmosphere-lamp"),
            DeviceItem(
                deviceName: "Eclairage\nambiant\n(Wi-Fi)",
                deviceImg: "atmosphere-lamp"),
            DeviceItem(
                deviceName: "Eclairage\nambiant\n(BLE)",
                deviceImg: "atmosphere-lamp")
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Lumière solaire",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Lumière\nsolaire\n(BLE)",
                deviceImg: "solar-light"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Plafonnier",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Plafonnier\n(BLE+Wi-Fi)", deviceImg: "plafonnier"),
            DeviceItem(
                deviceName: "Plafonnier\n(Wi-Fi)", deviceImg: "plafonnier"),
            DeviceItem(
                deviceName: "Plafonnier\n(Zigbee)", deviceImg: "plafonnier")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Plafonnier\n(BLE)", deviceImg: "plafonnier"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Télécomande d'éclairage",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Téléco\nmmande\nd'éclairage\n(BLE)",
                deviceImg: "remote-control-lighting"),
            DeviceItem(
                deviceName: "Téléco\nmmande\nd'éclairage\n(Zigbee)",
                deviceImg: "remote-control-lighting"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Ruban LED",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Ruban LED\n(BLE+Wi-Fi)", deviceImg: "ruban-led"),
            DeviceItem(
                deviceName: "Ruban LED\n(Wi-Fi)", deviceImg: "ruban-led"),
            DeviceItem(
                deviceName: "Ruban LED\n(Zigbee)", deviceImg: "ruban-led")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(deviceName: "Ruban LED\n(BLE)", deviceImg: "ruban-led"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Lumière à induction",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Lumière à\ninduction\n(BLE+Wi-Fi)",
                deviceImg: "induction-light"),
            DeviceItem(
                deviceName: "Lumière à\ninduction\n(Wi-Fi)",
                deviceImg: "induction-light"),
            DeviceItem(
                deviceName: "Lumière à\ninduction\n(Zigbee)",
                deviceImg: "induction-light")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Lumière à\ninduction\n(BLE)",
                deviceImg: "induction-light"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Screen Sync Controller",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Camera\nScreen Sync\nController\n(WI-Fi)",
                deviceImg: "camera-screen-sync-controller"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Street Light",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Street Light\n(NB-IoT)",
                deviceImg: "street-light"),
            DeviceItem(
                deviceName: "Street Light\n(LTE Cat. 1)",
                deviceImg: "street-light"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Ventilateur de plafond",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Ventilateur de\nplafond\n(BLE+Wi-Fi)",
                deviceImg: "ventilateur-plafond"),
            DeviceItem(
                deviceName: "Ventilateur de\nplafond\n(Wi-Fi)",
                deviceImg: "ventilateur-plafond"),
            DeviceItem(
                deviceName: "Ventilateur de\nplafond\n(Zigbee)",
                deviceImg: "ventilateur-plafond")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Ventilateur de\nplafond\n(BLE)",
                deviceImg: "ventilateur-plafond"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Lampe à incandescence",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Lampe à inca\nndescence\n(BLE+Wi-Fi)",
                deviceImg: "incandescence-lamp"),
            DeviceItem(
                deviceName: "Lampe à inca\nndescence\n(Wi-Fi)",
                deviceImg: "incandescence-lamp"),
            DeviceItem(
                deviceName: "Lampe à inca\nndescence\n(Zigbee)",
                deviceImg: "incandescence-lamp")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Lampe à inca\nndescence\n(BLE)",
                deviceImg: "incandescence-lamp"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Panneau lumineux",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Panneau\nlumineux\n(BLE+Wi-Fi)",
                deviceImg: "light-pannel"),
            DeviceItem(
                deviceName: "Panneau\nlumineux\n(Wi-Fi)",
                deviceImg: "light-pannel"),
            DeviceItem(
                deviceName: "Panneau\nlumineux\n(Zigbee)",
                deviceImg: "light-pannel")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Panneau\nlumineux\n(BLE)",
                deviceImg: "light-pannel"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Lampe de bureau",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Lampe de\ntable\n(BLE+Wi-Fi)",
                deviceImg: "table-lamp"),
            DeviceItem(
                deviceName: "Lampe de\ntable\n(Wi-Fi)",
                deviceImg: "table-lamp"),
            DeviceItem(
                deviceName: "Lampe de\ntable\n(Zigbee)",
                deviceImg: "table-lamp")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Lampe de\ntable\n(BLE)", deviceImg: "table-lamp"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Variateur de lumière",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Variateur de\nlumière\n(BLE+Wi-Fi)",
                deviceImg: "light-variator"),
            DeviceItem(
                deviceName: "Variateur de\nlumière\n(Wi-Fi)",
                deviceImg: "light-variator"),
            DeviceItem(
                deviceName: "Variateur de\nlumière\n(Zigbee)",
                deviceImg: "light-variator")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Variateur de\nlumière\n(BLE)",
                deviceImg: "light-variator"),
            DeviceItem(
                deviceName: "Variateur de\nlumière\n(autres)",
                deviceImg: "light-variator"),
            EmptyDeviceItem()
          ],
        )),
      ],
    );
  }
}

class SecurityAndCaptorsDeviceTypeList extends StatelessWidget {
  const SecurityAndCaptorsDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class BigDeviceTypeList extends StatelessWidget {
  const BigDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Vlimatisation",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Climatiseur\n(BLE+Wi-Fi)",
              deviceImg: "air-conditioner",
            ),
            DeviceItem(
              deviceName: "Climatiseur\n(Wi-Fi)",
              deviceImg: "air-conditioner",
            ),
            DeviceItem(
              deviceName: "Climatiseur\n(Zigbee)",
              deviceImg: "air-conditioner",
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Climatiseur\n(NB-IoT)",
              deviceImg: "air-conditioner",
            ),
            DeviceItem(
              deviceName: "Climatiseur\nportatif\n(BLE+Wi-Fi)",
              deviceImg: "air-conditioner-portatif",
            ),
            DeviceItem(
              deviceName: "Window Air\nConditionner\n(BLE+Wi-Fi)",
              deviceImg: "window-air-conditioner",
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
              deviceName: "Chauffe-eau\nsolaire\n(Wi-Fi)",
              deviceImg: "chauffe-eau-solaire",
            ),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Réfrigérateur",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
              deviceName: "Réfrigérateur\n(BLE+Wi-Fi)",
              deviceImg: "refrigerateur",
            ),
            DeviceItem(
                deviceName: "Réfrigérateur\n(Wi-Fi)",
                deviceImg: "refrigerateur"),
            DeviceItem(
                deviceName: "Réfrigérateur\n(BLE)", deviceImg: "refrigerateur")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Car\nRéfrigérateur\n(BLE)",
                deviceImg: "car-refrigerator"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Chauffe-eau",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Chauffe-eau\n(BLE+Wi-Fi)",
                deviceImg: "chauffe-eau"),
            DeviceItem(
                deviceName: "Chauffe-eau\n(Wi-Fi)", deviceImg: "chauffe-eau"),
            DeviceItem(
                deviceName: "Gas Water\nHeater\n(BLE+Wi-Fi)",
                deviceImg: "gas-water-heater")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Gas Water\nHeater\n(Wi-Fi)",
                deviceImg: "gas-water-heater"),
            DeviceItem(
                deviceName: "Air Source\nWater Heater\n(BLE+Wi-Fi)",
                deviceImg: "air-source-water-heater"),
            DeviceItem(
                deviceName: "Chauffe-eau\nsolaire\n(BLE+Wi-Fi)",
                deviceImg: "water-cold-solar"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Chauffe-eau\nsolaire\n(Wi-Fi)",
                deviceImg: "water-cold-solar"),
            DeviceItem(
                deviceName: "Chauffe-eau\nsolaire\n(NB-IoT)",
                deviceImg: "water-cold-solar"),
            DeviceItem(
                deviceName: "Mini Water\nHeater\n(BLE+Wi-Fi)",
                deviceImg: "mini-water-heater"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Mini Water\nHeater\n(BLE)",
                deviceImg: "mini-water-heater"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Wall-hung Boiler",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Chaudière\nmurale\n(BLE+Wi-Fi)",
                deviceImg: "chaudière-mural"),
            DeviceItem(
                deviceName: "Chaudière\nmurale\n(Wi-Fi)",
                deviceImg: "chaudière-mural"),
            EmptyDeviceItem()
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Smart Heat Pump",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Pompe à\nchaleur\nintelligente\n(BLE+Wi-Fi)",
                deviceImg: "smart-heat-pump"),
            DeviceItem(
                deviceName: "Smart Heat\nPump\n(Wi-Fi)",
                deviceImg: "smart-heat-pump"),
            EmptyDeviceItem()
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Machine à laver",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Lave-linge\n(BLE+Wi-Fi)", deviceImg: "lave-linge"),
            DeviceItem(
                deviceName: "Lave-linge\n(Wi-Fi)", deviceImg: "lave-linge"),
            EmptyDeviceItem()
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Sèche-linge",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeviceItem(
                deviceName: "Sèche-linge\n(BLE+Wi-Fi)",
                deviceImg: "seche-linge"),
          ],
        )),
      ],
    );
  }
}

class SmallDeviceTypeList extends StatelessWidget {
  const SmallDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class DomesticDeviceTypeList extends StatelessWidget {
  const DomesticDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class HealthDeviceTypeList extends StatelessWidget {
  const HealthDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class CameraAndLockDeviceTypeList extends StatelessWidget {
  const CameraAndLockDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class ControlDeviceTypeList extends StatelessWidget {
  const ControlDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class TravelDeviceTypeList extends StatelessWidget {
  const TravelDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class EnergyDeviceTypeList extends StatelessWidget {
  const EnergyDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class EntertainmentDeviceTypeList extends StatelessWidget {
  const EntertainmentDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(deviceName: "La télé", deviceImg: "tele"),
            DeviceItem(
                deviceName: "Cadre photo\nnuage",
                deviceImg: "cadre-photo-nuage"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Printer",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Imprimante\ngraphique\n(Wi-Fi)",
                deviceImg: "graphic-printer"),
            DeviceItem(
                deviceName: "Imprimante\n3D\n(Wi-Fi)", deviceImg: "3d-printer"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Dot Matrix Screen",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(deviceName: "12x48", deviceImg: "12x48"),
            DeviceItem(deviceName: "5x36\n(BLE)", deviceImg: "12x48"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Text(
          "Autres",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Machine à\nhistoires",
                deviceImg: "machine-histoire"),
            DeviceItem(deviceName: "Liseuse", deviceImg: "liseuse"),
            Container(
              width: width(context) * 0.15,
              height: 50,
            )
          ],
        )),
        SizedBox(
          height: height(context) * 0.03,
        ),
      ],
    );
  }
}

class IndustryAndAgricultureDeviceTypeList extends StatelessWidget {
  const IndustryAndAgricultureDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class OtherDeviceTypeList extends StatelessWidget {
  const OtherDeviceTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Autres",
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 212, 211, 211)),
        ),
        SizedBox(
          height: height(context) * 0.03,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Connecteur\n(Wi-Fi)", deviceImg: "connecteur"),
            DeviceItem(
                deviceName: "Téléco\nmmande\nuniverselle",
                deviceImg: "universel-remote-control"),
            DeviceItem(
                deviceName: "Téléco\nmmande\nuniverselle\n(BLE+Wi-Fi)",
                deviceImg: "universel-remote-control")
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(deviceName: "Connecteur", deviceImg: "connecteur"),
            DeviceItem(deviceName: "Autres\n(Wi-Fi)", deviceImg: "other"),
            DeviceItem(deviceName: "Autres\n(Zigbee)", deviceImg: "other"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(deviceName: "Autres\n(BLE)", deviceImg: "other"),
            DeviceItem(deviceName: "Autres\n(NB-IoT)", deviceImg: "other"),
            DeviceItem(deviceName: "Autres", deviceImg: "other"),
          ],
        )),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceItem(
                deviceName: "Haut-parleur\nintelligent",
                deviceImg: "smart-hight-speaker"),
            DeviceItem(
                deviceName: "Petit\nAscenseur\n(Wi-Fi)",
                deviceImg: "small-ascensor"),
            DeviceItem(
                deviceName: "Tablette de\nconférence",
                deviceImg: "meeting-tablet"),
          ],
        )),
      ],
    );
  }
}

class EmptyDeviceItem extends StatelessWidget {
  const EmptyDeviceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.15,
      height: 50,
    );
  }
}
