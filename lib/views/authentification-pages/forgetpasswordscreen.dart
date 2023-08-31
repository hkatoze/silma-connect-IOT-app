import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/authentification-pages/checkingcodescreen.dart';
import 'package:silma_connect/views/authentification-pages/widgets/rounded-button.dart';
import 'package:silma_connect/views/authentification-pages/widgets/text-field-input.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool emailIsValid = false;
  bool startMailEdit = false;
  TextEditingController _emailController = TextEditingController();

  void initState() {
    super.initState();
    _emailController.addListener(_checkEmail);
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
                        "Mot de passe oublié",
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
                      height: height(context) * 0.1,
                    ),
                    InkWell(
                        onTap: () {
                          if (emailIsValid) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 500),
                                    reverseDuration:
                                        Duration(milliseconds: 500),
                                    child: CheckingCodeScreen(email:_emailController.text),
                                    childCurrent: ForgetPasswordScreen()));
                          }
                        },
                        child: Container(
                          width: width(context) * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                emailIsValid ? Colors.blue : Color(0xFFd3e5fd),
                          ),
                          child: TextButton(
                            onPressed: null,
                            child: Text(
                              "Obtenir le code de vérification",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                  ]))),
    );
  }
}
