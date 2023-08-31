import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silma_connect/constant.dart';

class CreateSceneScreen extends StatefulWidget {
  const CreateSceneScreen({Key? key}) : super(key: key);

  @override
  State<CreateSceneScreen> createState() => _CreateSceneScreenState();
}

class _CreateSceneScreenState extends State<CreateSceneScreen> {
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
                            "Créer une scène",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                          Container()
                        ]),
                  ),
                  SizedBox(
                    height: height(context) * 0.023,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.02,
                        vertical: height(context) * 0.02),
                    decoration: BoxDecoration(
                        color: Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TypeSceneItem(
                        example:
                            "Exemple: éteindre toutes les lumières de la chambre à coucher d'une seule touche.",
                        leftLogo: Icons.touch_app,
                        iconColor: Colors.orange,
                        title: "Scénario manuel"),
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
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 500),
                                  child: MeteoSceneConfigure(),
                                  childCurrent: CreateSceneScreen()));
                        },
                        child: TypeSceneItem(
                            example:
                                "Exemple: lorsque la température locale est supérieure à 28 C.",
                            leftLogo: Icons.sunny,
                            iconColor: Colors.yellow,
                            title: "Lorsque la météo change"),
                      ),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      TypeSceneItem(
                          example:
                              "Exemple: Après que vous ayez quitté la maison.",
                          leftLogo: Icons.location_on,
                          iconColor: Colors.red,
                          title: "Lorsque le lieu change"),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      TypeSceneItem(
                          example: "Exemple: à 7h tous les matins.",
                          leftLogo: Icons.watch_later,
                          iconColor: Colors.blue,
                          title: "Programmation horaire"),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      TypeSceneItem(
                          example:
                              "Exemple: lorqu'une activité inhabituelle est détectée.",
                          leftLogo: Icons.lightbulb,
                          iconColor: Colors.green,
                          title: "Lorsque le statut de l'appareil change"),
                    ]),
                  )
                ]),
          )),
    );
  }
}

class TypeSceneItem extends StatelessWidget {
  final IconData leftLogo;
  final Color iconColor;
  final String title;
  final String example;

  const TypeSceneItem(
      {Key? key,
      required this.example,
      required this.leftLogo,
      required this.iconColor,
      required this.title})
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
              color: iconColor,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: height(context) * 0.03),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      example,
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    )
                  ]),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
    );
  }
}

class MeteoSceneConfigure extends StatefulWidget {
  const MeteoSceneConfigure({Key? key}) : super(key: key);

  @override
  State<MeteoSceneConfigure> createState() => _MeteoSceneConfigureState();
}

class _MeteoSceneConfigureState extends State<MeteoSceneConfigure> {
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
                            "Lorsque la météo change",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                          Container()
                        ]),
                  ),
                  SizedBox(
                    height: height(context) * 0.023,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.02,
                        vertical: height(context) * 0.02),
                    decoration: BoxDecoration(
                        color: Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MeteoConfigureItem(title: "Température"),
                          SizedBox(
                            height: height(context) * 0.05,
                          ),
                          MeteoConfigureItem(title: "Humidité"),
                          SizedBox(
                            height: height(context) * 0.05,
                          ),
                          MeteoConfigureItem(title: "Météo"),
                          SizedBox(
                            height: height(context) * 0.05,
                          ),
                          MeteoConfigureItem(title: "Coucher/lever du soleil"),
                          SizedBox(
                            height: height(context) * 0.05,
                          ),
                          MeteoConfigureItem(title: "Vitesse du vent"),
                        ]),
                  )
                ]),
          )),
    );
  }
}

class MeteoConfigureItem extends StatelessWidget {
  final String title;
  const MeteoConfigureItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold)),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey.withOpacity(0.5),
        )
      ]),
    );
  }
}
