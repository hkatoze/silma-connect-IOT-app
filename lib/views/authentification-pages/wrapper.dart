import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:silma_connect/views/apppages/navigationMananger.dart';
import 'package:silma_connect/views/authentification-pages/firstscreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);

    return _user == null
        ? FirstScreen()
        : PrincipalScreen(
            isTry: false,
          );
  }
}
