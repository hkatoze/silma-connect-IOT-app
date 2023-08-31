import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/views/apppages/homescreen.dart';
import 'package:silma_connect/views/apppages/navigationMananger.dart';
import 'package:silma_connect/views/authentification-pages/loginscreen.dart';
import 'package:silma_connect/views/authentification-pages/signupscreen.dart';
import 'package:silma_connect/views/authentification-pages/widgets/rounded-button.dart';
import 'package:silma_connect/constant.dart';

class FirstScreen extends StatelessWidget {
  void tryBottomModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: false,
        builder: (context) => TryContinueModal());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_img.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Flexible(
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 125,
                height: 125,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      child: LoginScreen(),
                      childCurrent: this));
            },
            child:
                RoundedButton(color: Colors.blue, buttonName: "Connectez-vous"),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 500),
                        child: SignupScreen(),
                        childCurrent: this));
              },
              child: RoundedButton(
                  color: Colors.white, buttonName: "S'enregister")),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              tryBottomModal(context);
            },
            child: Text(
              "Essayer",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height(context) * 0.02,
          )
        ]),
      )
    ]);
  }
}

class TryContinueModal extends StatefulWidget {
  const TryContinueModal({Key? key}) : super(key: key);

  @override
  State<TryContinueModal> createState() => _TryContinueModalState();
}

class _TryContinueModalState extends State<TryContinueModal> {
  String countryHere = "Burkina Faso (BF)";
  bool inLoginProcess = false;

  Future<void> login() async {
    setState(() {
      inLoginProcess = true;
    });
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      inLoginProcess = false;
    });
    Navigator.push(
        context,
        PageTransition(
            alignment: Alignment.center,
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            type: PageTransitionType.fade,
            child: PrincipalScreen(
              
              isTry: true,
            ),
            childCurrent: LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: height(context) * 0.3,
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
                showCountryPicker(
                  context: context,
                  // optional. Shows phone code before the country name.
                  onSelect: (Country country) {
                    setState(() {
                      countryHere = country.displayNameNoCountryCode;
                    });
                  },
                );
              },
              child: Container(
                child: Row(children: [
                  Text(
                    countryHere,
                    style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  )
                ]),
              ),
            ),
          ],
        )),
        SizedBox(
          height: height(context) * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
          child: Text(
              "Sans compte, vous ne pourrez pas utiliser certaines fonctions de l'application",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: height(context) * 0.07,
        ),
        Center(
          child: InkWell(
            onTap: () {
              login();
            },
            child: Container(
                width: width(context) * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: inLoginProcess ? Color(0xFFd3e5fd) : Colors.blue,
                ),
                child: Center(
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    TextButton(
                      onPressed: null,
                      child: Text(
                        "Continuer",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    if (inLoginProcess)
                      SpinKitCircle(
                        color: Colors.blue,
                        size: 50.0,
                      )
                  ]),
                )),
          ),
        )
      ]),
    );
  }
}
