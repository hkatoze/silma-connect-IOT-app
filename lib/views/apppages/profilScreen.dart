import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/addDeviceScreen.dart';
import 'package:silma_connect/views/authentification-pages/checkingcodescreen.dart';
import 'package:silma_connect/views/authentification-pages/widgets/googleConnect.dart';
import 'package:silma_connect/views/authentification-pages/widgets/rounded-button.dart';
import 'package:silma_connect/views/authentification-pages/widgets/text-field-input.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CompleteAccountFormScreen extends StatefulWidget {
  const CompleteAccountFormScreen({Key? key}) : super(key: key);

  @override
  State<CompleteAccountFormScreen> createState() =>
      _CompleteAccountFormScreenState();
}

class _CompleteAccountFormScreenState extends State<CompleteAccountFormScreen> {
  bool politicsIsOk = false;
  bool inLoginProcess = false;
  bool emailIsValid = false;
  bool phoneNumberIsValid = false;
  bool startMailEdit = false;
  bool startPhoneNumberEdit = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  void initState() {
    super.initState();
    _emailController.addListener(_checkEmail);
    _phoneNumberController.addListener(_checkPhoneNumber);
  }

  Future<void> register(
      String country, String email, String phoneNumber) async {
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
            child: CheckingCodeScreen(email: _emailController.text),
            childCurrent: CompleteAccountFormScreen()));
  }

  _checkEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    if (emailValid)
      setState(() {
        emailIsValid = true;
      });
    else {
      setState(() {
        emailIsValid = false;
      });
    }
  }

  _checkPhoneNumber() {
    bool emailValid =
        RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(_emailController.text);

    if (emailValid)
      setState(() {
        emailIsValid = true;
      });
    else {
      setState(() {
        emailIsValid = false;
      });
    }
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
                          children: [backbtn(context)]),
                    ),
                    SizedBox(
                      height: height(context) * 0.04,
                    ),
                    Container(
                      child: Text(
                        "Complétez le compte",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.02,
                    ),
                    TextInputWithIcon(
                      icon: Icons.arrow_drop_down,
                      hint: "Burkina Faso",
                    ),
                    SizedBox(
                      height: height(context) * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: height(context) * 0.08,
                        width: width(context) * 0.8,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFf6f7fb),
                          border: Border.all(color: Color(0xFFcbcbcb)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              setState(() {
                                startPhoneNumberEdit = true;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Numéro de téléphone",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: height(context) * 0.08,
                        width: width(context) * 0.8,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFf6f7fb),
                          border: Border.all(
                              color: startMailEdit == true
                                  ? (emailIsValid
                                      ? Color(0xFFcbcbcb)
                                      : Colors.red)
                                  : Color(0xFFcbcbcb)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _emailController,
                            onChanged: (value) {
                              setState(() {
                                startMailEdit = true;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "adresse email",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.005,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.06),
                      child: Visibility(
                        visible: startMailEdit ? !emailIsValid : false,
                        child: Row(children: [
                          Text("Entrer une adresse email valide",
                              style: TextStyle(color: Colors.red))
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: politicsIsOk,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    politicsIsOk = !politicsIsOk;
                                  });
                                }),
                            Expanded(
                                child: RichText(
                              overflow: TextOverflow.clip,
                              text: TextSpan(
                                  text: "J’ai lu et je valide la ",
                                  children: [
                                    TextSpan(
                                        text:
                                            "Politique de confidentialité Accord de l’utilisateur ",
                                        style: TextStyle(
                                            color: Color(0xFF8eccff))),
                                    TextSpan(text: "et"),
                                    TextSpan(
                                        text:
                                            " Politique de confidentialité relative aux enfants",
                                        style:
                                            TextStyle(color: Color(0xFF8eccff)))
                                  ],
                                  style: TextStyle(color: Color(0xFFcfcfcf))),
                            ))
                          ]),
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        if (emailIsValid && politicsIsOk) {
                          register("Burkina Faso", _emailController.text,
                              _phoneNumberController.text);
                        }
                      },
                      child: Container(
                          width: width(context) * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: inLoginProcess
                                ? Color(0xFFd3e5fd)
                                : (emailIsValid && politicsIsOk)
                                    ? Colors.blue
                                    : Color(0xFFd3e5fd),
                          ),
                          child: Center(
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  TextButton(
                                    onPressed: null,
                                    child: Text(
                                      "Obtenir le code de vérification",
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
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    GoogleConnect()
                  ]))),
    );
  }
}

class CompleteAccountInfoScreen extends StatefulWidget {
  const CompleteAccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<CompleteAccountInfoScreen> createState() =>
      _CompleteAccountInfoScreenState();
}

class _CompleteAccountInfoScreenState extends State<CompleteAccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Container()
                ]),
          ),
          SizedBox(
            height: height(context) * 0.023,
          ),
          Text(
            "Complétez le compte",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          SizedBox(
            height: height(context) * 0.01,
          ),
          Text(
            "Après avoir compléter le compte les fonctions suivantes seront disponibles:",
            style: TextStyle(
                color: Color.fromARGB(255, 177, 177, 177), fontSize: 15),
          ),
          SizedBox(
            height: height(context) * 0.05,
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15,
                width: 15,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 194, 215, 233),
                  child: Icon(
                    Icons.adjust,
                    size: 9,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stockage dans le cloud",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Après l'enregistrement tous les, tous les appareils peuvent être enregistrer dans le cloud, ce qui est pratique pour la synchronisation multi-extrémité des informations sur les appareils.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 177, 177, 177),
                          fontSize: 16),
                    )
                  ],
                ),
              ))
            ],
          )),
          SizedBox(
            height: height(context) * 0.03,
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15,
                width: 15,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 194, 215, 233),
                  child: Icon(
                    Icons.adjust,
                    size: 9,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contrôle vocal tiers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Accès à d'autres assistants vocaux tiers, tels que Amazon Alexa, Google Home, etc.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 177, 177, 177),
                          fontSize: 16),
                    ),
                  ],
                ),
              ))
            ],
          )),
          SizedBox(
            height: height(context) * 0.03,
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15,
                width: 15,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 194, 215, 233),
                  child: Icon(
                    Icons.adjust,
                    size: 9,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Partage d'appareils",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Partagez vos appareils avec vos amis et les membres de votre famille.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 177, 177, 177),
                          fontSize: 16),
                    )
                  ],
                ),
              ))
            ],
          )),
          Expanded(child: Container()),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 500),
                        child: CompleteAccountFormScreen(),
                        childCurrent: CompleteAccountInfoScreen()));
              },
              child: Container(
                  width: width(context) * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        "Complétez le compte",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: height(context) * 0.05,
          ),
        ]),
      ),
    );
  }
}

class ProfilScreen extends StatefulWidget {
  final bool isTry;
  const ProfilScreen({Key? key, required this.isTry}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
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
            Text(
              "",
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
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
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
        InkWell(
          onTap: () {
            if (_user!.email == "trysystememail@gmail.com") {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      type: PageTransitionType.leftToRight,
                      child: CompleteAccountInfoScreen(),
                      childCurrent: ProfilScreen(
                        isTry: true,
                      )));
            }
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 216, 216, 216),
                        child: Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          _user!.email != "trysystememail@gmail.com"
                              ? _user.displayName!
                              : "TouristHKyrH",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          _user.email != "trysystememail@gmail.com"
                              ? _user.email.toString()
                              : "Complétez le compte",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 177, 177, 177)),
                        )
                      ])),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        child: _user.email != "trysystememail@gmail.com"
                            ? Container()
                            : CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.02,
              vertical: height(context) * 0.02),
          decoration: BoxDecoration(
              color: Color(0xFFf2f2f2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 500),
                        reverseDuration: Duration(milliseconds: 500),
                        type: PageTransitionType.leftToRight,
                        child: HomeManagerScreen(
                          isTry: widget.isTry,
                        ),
                        childCurrent: ProfilScreen(
                          isTry: true,
                        )));
              },
              child: ProfilScreenItem(
                  leftLogo: Icons.home, title: "Gestion de la \"Maison\""),
            ),
            SizedBox(
              height: height(context) * 0.05,
            ),
            ProfilScreenItem(
                leftLogo: Icons.message, title: "Centre de messagerie"),
            SizedBox(
              height: height(context) * 0.05,
            ),
            InkWell(
                onTap: () {
                  if (_user.email == "trysystememail@gmail.com") {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            type: PageTransitionType.leftToRight,
                            child: CompleteAccountInfoScreen(),
                            childCurrent: ProfilScreen(
                              isTry: true,
                            )));
                  } else {}
                },
                child: ProfilScreenItem(
                    leftLogo: Icons.help_outline, title: "FAQ et commentaires"))
          ]),
        )
      ]),
    ));
  }
}

class ProfilScreenItem extends StatelessWidget {
  final IconData leftLogo;

  final String title;

  const ProfilScreenItem(
      {Key? key, required this.leftLogo, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              leftLogo,
              size: 35,
              color: Colors.grey.withOpacity(0.3),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: height(context) * 0.03),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold),
              ),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
    );
  }
}

class HomeManagerScreen extends StatefulWidget {
  final bool isTry;
  const HomeManagerScreen({Key? key, required this.isTry}) : super(key: key);

  @override
  State<HomeManagerScreen> createState() => _HomeManagerScreenState();
}

class _HomeManagerScreenState extends State<HomeManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        "Gestion de la \"Maison\"",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      Container()
                    ]),
              ),
              SizedBox(
                height: height(context) * 0.07,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.02,
                      vertical: height(context) * 0.02),
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Ajouter une \"Maison\"",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.023,
              ),
              InkWell(
                onTap: () {
                  if (widget.isTry) {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            type: PageTransitionType.theme,
                            child: CompleteAccountInfoScreen(),
                            childCurrent: HomeManagerScreen(
                              isTry: true,
                            )));
                  } else {}
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.02,
                      vertical: height(context) * 0.02),
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Se joindre à un domicile",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
