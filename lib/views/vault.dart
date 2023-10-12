import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart%20';
import 'package:the_bank/models/prodsx_rx.dart';
import '../provider.dart';
import 'package:the_bank/models/menu_floating_action_prodsx.dart';


class Vault extends StatefulWidget {
  const Vault({Key? key}) : super(key: key);

  @override
  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  late Timer _timer;

  @override

  initState() {
    //
  _timer =  Timer.periodic(const Duration(seconds: 5), (timer) {
      Provider.of<RxStatus>(context,listen: false).getFeedback("vault");
      print('vault');
    });
    print("vault initState Called");
  }

  void dispose() {
    print('dispose vault');
    _timer?.cancel();
    super.dispose();
  }


  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Stack(
      children:[ Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Left
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 150),

                  RotatedBox(quarterTurns:3 , child: ProDsxRx(rxLabel: 'Vault 4', rxId: '4')),
                  SizedBox(height: 20),
                  RotatedBox(quarterTurns:3 , child: ProDsxRx(rxLabel: 'Vault 3', rxId: '3')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,80.0,0,0),
                    child: ProDsxRx(rxLabel: 'DJ', rxId: '16'),
                  ),


                ],
              ),
            ],

          ),

          //Bar Column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.fromLTRB(50.0,5,50,5),
                child: Text('Exit',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20
                  ),

                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)
                ),
              ),
              Expanded(child: Container()),
              Chip(
                avatar: Icon(Icons.wine_bar_sharp,color: Colors.white,size: 16,),
                label: const Text('BAR',style: TextStyle(color: Colors.white,fontSize: 16),),
                backgroundColor: Colors.grey,
                padding: EdgeInsets.fromLTRB(10,200,10,200),
              ),
              Expanded(child: Container()),


              Row(
                children: [
                  ProDsxRx(rxLabel: 'Vault 2', rxId: '2'),
                  ProDsxRx(rxLabel: 'Vault 1', rxId: '1'),
                ],
              ),

            ],
          ),


          //Exit Wall
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  ProDsxRx(rxLabel: 'Vault 5', rxId: '5'),
                  ProDsxRx(rxLabel: 'Vault 6', rxId: '6'),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.fromLTRB(50.0,5,50,5),
                child: Text('Door',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),

                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),)

            ],
          ),

          //Right Wall
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(quarterTurns:1 , child: ProDsxRx(rxLabel: 'Vault 7', rxId: '7')),
              RotatedBox(quarterTurns:1 , child: ProDsxRx(rxLabel: 'Vault 8', rxId: '8')),
              RotatedBox(quarterTurns:1 , child: ProDsxRx(rxLabel: 'Vault 9', rxId: '9')),
            ],
          )
        ],

      ),

        ProdsxFloatingMenuButton()
      ],
    );


  }
}
