import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/createSceneScreen.dart';
import 'package:silma_connect/views/apppages/homescreen.dart';
import 'package:silma_connect/views/apppages/profilScreen.dart';
import 'package:silma_connect/views/apppages/widgets/rooms-widgets.dart';
import 'package:silma_connect/views/apppages/widgets/scenes-widgets.dart';
import 'package:silma_connect/views/authentification-pages/widgets/rounded-button.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen(
      {Key? key,
      required this.isTry,
      this.email,
      this.password,
      this.phoneNumber})
      : super(key: key);
  final bool isTry;
  final String? email;
  final String? password;
  final String? phoneNumber;

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int selectedPos = 0;

  late CircularBottomNavigationController _navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Ma Maison", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
    TabItem(Icons.touch_app, "Scène", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
    TabItem(Icons.flash_on_rounded, "Consommation", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
    TabItem(Icons.account_circle, "Profil", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
  ]);
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: 60),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    Widget page;
    switch (selectedPos) {
      case 0:
        page = Homescreen(
          isTry: widget.isTry,
        );
        break;
      case 1:
        page = Container();
        break;
      case 2:
        page = Container();
        break;
      case 3:
        page = ProfilScreen(
          isTry: widget.isTry,
        );
        break;
      default:
        page = Container();
        break;
    }

    return GestureDetector(
      child: page,
      onTap: () {},
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: 60,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
