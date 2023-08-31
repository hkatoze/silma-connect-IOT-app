import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/apppages/homescreen.dart';
import 'package:silma_connect/views/apppages/navigationMananger.dart';
import 'package:silma_connect/views/authentification-pages/forgetpasswordscreen.dart';
import 'package:silma_connect/views/authentification-pages/widgets/googleConnect.dart';

import 'package:silma_connect/views/authentification-pages/widgets/text-field-input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool politicsIsOk = false;

  bool emailIsValid = false;
  bool passwordIsValid = false;
  bool startMailEdit = false;
  bool obscureText = true;
  bool startPasswordEdit = false;
  bool inLoginProcess = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void initState() {
    super.initState();
    _emailController.addListener(_checkEmail);
    _passwordController.addListener(_checkPassword);
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

  _checkPassword() {
    bool passwordValid = (_passwordController.text.length >= 8);

    if (passwordValid)
      setState(() {
        passwordIsValid = true;
      });
    else {
      setState(() {
        passwordIsValid = false;
      });
    }
  }

  Future<void> login(String country, String email, String password) async {
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
              isTry: false,
              email: _emailController.text,
              password: _passwordController.text,
            ),
            childCurrent: LoginScreen()));
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
                        "Connectez-vous",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
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
                              color: startPasswordEdit == true
                                  ? (passwordIsValid
                                      ? Color(0xFFcbcbcb)
                                      : Colors.red)
                                  : Color(0xFFcbcbcb)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            obscureText: obscureText,
                            controller: _passwordController,
                            onChanged: (value) {
                              setState(() {
                                startPasswordEdit = true;
                              });
                            },
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 25,
                                    color: Color(0xFFcbcbcb),
                                  ),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: "mot de passe",
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
                        visible: startPasswordEdit ? !passwordIsValid : false,
                        child: Row(children: [
                          Expanded(
                              child: Text("Minimum 8 caractères.",
                                  style: TextStyle(color: Colors.red)))
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
                        if (emailIsValid && passwordIsValid && politicsIsOk) {
                          login("Burkina Faso", _emailController.text,
                              _passwordController.text);
                        }
                      },
                      child: Container(
                          width: width(context) * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: inLoginProcess
                                ? Color(0xFFd3e5fd)
                                : (emailIsValid &&
                                        passwordIsValid &&
                                        politicsIsOk)
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
                                      "Se Connecter",
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
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 500),
                                  child: ForgetPasswordScreen(),
                                  childCurrent: LoginScreen()));
                        },
                        child: Text(
                          "Mot de passe oublié",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    GoogleConnect()
                  ]))),
    );
  }
}
