import 'package:flutter/material.dart';
import 'package:silma_connect/views/apppages/addDeviceScreen.dart';

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Color primaryColor = Color(0XFF000000);
Color secondaryColor = Color(0xFFec3655);

Color threeColor = Color.fromARGB(255, 255, 170, 170);
const TextStyle kBodyText =
    TextStyle(fontSize: 19, color: Colors.black, height: 1.5);

InkWell backbtn(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios),
  );
}

void aboutCameraAutorizationBottomModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: false,
      builder: (context) => AboutCameraAutorization());
}

void aboutBluetoothAutorizationBottomModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: false,
      builder: (context) => AboutBluetoothAutorization());
}
