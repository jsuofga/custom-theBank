import 'package:flutter/material.dart';
import 'package:the_bank/models/zone_button.dart';

class Zoneselect extends StatefulWidget {
  const Zoneselect({Key? key}) : super(key: key);

  @override
  _ZoneselectState createState() => _ZoneselectState();
}

class _ZoneselectState extends State<Zoneselect> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:400, child: Image.asset('assets/bank_logo.png')),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ZoneButton(zoneLabel: 'Bank', zone: 1,pageIndexWhenSelected: 1,),ZoneButton(zoneLabel: 'Vault', zone: 2,pageIndexWhenSelected: 3,)

                    ],
                  ),
                ],
              )
            );


  }
}