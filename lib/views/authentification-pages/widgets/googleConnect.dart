import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/views/authentification-pages/wrapper.dart';
import 'package:silma_connect/views/services/authentication.dart';

class GoogleConnect extends StatefulWidget {
  const GoogleConnect({Key? key}) : super(key: key);

  @override
  State<GoogleConnect> createState() => _GoogleConnectState();
}

class _GoogleConnectState extends State<GoogleConnect> {
  bool isLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    return isLoginProcess
        ? SpinKitCircle(color: Color.fromARGB(255, 184, 219, 248))
        : InkWell(
            onTap: () {
              signIn();
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFFcbcbcb).withOpacity(0.5),
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/google.png")),
            ));
  }

  signIn() async {
    setState(() {
      isLoginProcess = true;
    });

   await  AuthService().signInWithGoogle();
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            child: Wrapper(),
            childCurrent: GoogleConnect()));
  }
}
