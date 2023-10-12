import 'dart:async';
import 'package:flutter/material.dart';
import 'package:the_bank/models/pillar.dart';
import 'package:the_bank/models/prodsx_rx.dart';
import 'package:the_bank/models/projector.dart';
import 'package:the_bank/provider.dart';
import 'package:provider/provider.dart ';
import 'package:the_bank/views/bank_bar1_bar2.dart';
import 'package:the_bank/views/bank_projector1_projector2.dart';
import 'package:the_bank/models/menu_floating_action_prodsx.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
  late Timer _timer;

  @override

  initState() {
    //
  _timer =  Timer.periodic(const Duration(seconds: 5), (timer) {
      Provider.of<RxStatus>(context,listen: false).getFeedback("bank");
      print('bank');
    });
    print("bank initState Called");
  }
  void dispose() {
    print('dispose bank');
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Stack(
      children:[Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Bank Projector1, Projector 2
            Bank_projector1_projector2(),

            // Pillars 1-6 and DJ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Pillar(
                  pillarID: '1',startRX: '23', rxID_top: '23',rxID_left: '24',rxID_right: '26',rxID_bottom: '25',
                ),
                ProDsxRx(rxLabel: 'DJ', rxId: '14'),
                Pillar(
                  pillarID: '4',startRX: '35', rxID_top: '35',rxID_left: '36',rxID_right: '38',rxID_bottom: '37',
                )
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Pillar(
                  pillarID: '2',startRX: '27', rxID_top: '27',rxID_left: '28',rxID_right: '30',rxID_bottom: '29',
                ),
                Pillar(
                  pillarID: '5',startRX: '39', rxID_top: '39',rxID_left: '40',rxID_right: '42',rxID_bottom: '41',
                ),
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Pillar(
                  pillarID: '3',startRX: '31', rxID_top: '31',rxID_left: '32',rxID_right: '34',rxID_bottom: '33',
                ),
                SizedBox(width: 150,),
                Pillar(
                  pillarID: '6',startRX: '43', rxID_top: '43',rxID_left: '44',rxID_right: '46',rxID_bottom: '45',
                )
              ],

            ),

            // Bar1 and Bar2 Section
            Bank_bar1_bar2()

          ]


      ),
        ProdsxFloatingMenuButton()
      ]
    );

  }
}
