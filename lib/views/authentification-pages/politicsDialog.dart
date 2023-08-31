import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';
import 'package:silma_connect/views/authentification-pages/firstscreen.dart';


class PoliticsAlert extends StatefulWidget {
  const PoliticsAlert({Key? key}) : super(key: key);

  @override
  State<PoliticsAlert> createState() => _PoliticsAlertState();
}

class _PoliticsAlertState extends State<PoliticsAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF999999),
        body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Center(
                            child: Text(
                          "Politique de confidentialité",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                      SingleChildScrollView(
                          child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          "Nous comprenons l’importance de la protection de votre vie privée.\nPour présenter pleinement le mode de collecte et d’utilisation de vos informations personnelles,nous avons révisé en détail notre«politique de confidentialité»,«Accord d’utilisation» conformément aux dernières lois et règlementation",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "Politique de  confidentialité Accord de l’utilisateur",
                              children: [
                                TextSpan(
                                    text: " et",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                  text:
                                      " Politique de  confidentialité relative aux enfants",
                                )
                              ],
                              style: TextStyle(
                                  color: Color(0xFF8eccff), fontSize: 16),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTopPop,
                                    child: FirstScreen(),
                                    childCurrent: PoliticsAlert()));
                          },
                          child: Container(
                            width: width(context) * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blue,
                            ),
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                "D'accord",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Pas d'accord",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFF7e7e7e)),
                              ))),
                    ]),
              )),
        ));
  }
}
