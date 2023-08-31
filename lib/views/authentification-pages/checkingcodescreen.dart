import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/authentification-pages/widgets/googleConnect.dart';
import 'package:silma_connect/views/authentification-pages/widgets/rounded-button.dart';
import 'package:silma_connect/views/authentification-pages/widgets/text-field-input.dart';

class CheckingCodeScreen extends StatefulWidget {
  final String email;
  const CheckingCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<CheckingCodeScreen> createState() => _CheckingCodeScreenState();
}

class _CheckingCodeScreenState extends State<CheckingCodeScreen> {
  TextEditingController identifier_code = TextEditingController();
  int time = 40;

  void initState() {
    super.initState();
    sendAgainCode();
  }

  Future<void> sendAgainCode() async {
    for (int i = 0; time > 0; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        time = time - 1;
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
                      height: height(context) * 0.05,
                    ),
                    Container(
                      child: Text(
                        "Entrer le code de vérification",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    PinCodeTextField(
                      controller: identifier_code,
                      pinTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      pinBoxColor: Color(0xFFcbcbcb),
                      autofocus: true,
                      highlight: true,
                      highlightColor: Color(0xFFd1e5fe),
                      defaultBorderColor: Colors.white,
                      hasTextBorderColor: Color(0xFFd1e5fe),
                      highlightPinBoxColor: Color(0xFFd1e5fe),
                      maxLength: 6,
                      pinBoxRadius: 12,
                      pinBoxHeight: height(context) * 0.06,
                      pinBoxWidth: width(context) * 0.12,
                      wrapAlignment: WrapAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: RichText(
                              overflow: TextOverflow.clip,
                              text: TextSpan(
                                  text:
                                      "Le code de vérification a été envoyé à votre adresse email: " +
                                          widget.email.toString(),
                                  children: [
                                    TextSpan(
                                        text:
                                            " Renvoyer ${time == 0 ? "" : "(${time} s)"}",
                                        style: TextStyle(
                                            color: Color(0xFF8eccff))),
                                  ],
                                  style: TextStyle(color: Color(0xFFcfcfcf))),
                            ))
                          ]),
                    ),
                    SizedBox(
                      height: height(context) * 0.1,
                    ),
                    Text(
                      "Vous n'avez pas reçu de code?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ]))),
    );
  }
}
