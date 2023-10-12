import 'package:flutter/material.dart';
import 'package:the_bank/models/projector.dart';
import 'package:the_bank/provider.dart';
import 'package:provider/provider.dart ';


class Bank_projector1_projector2 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                ProDsxRxProjector(
                    rxLabel: 'Projector 1',
                    rxId: '15',
                ),
                // SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<SwitchProDsxRX>(context,listen: false).mergeRx(2, 15, 19);
                    Provider.of<PageSelect>(context,listen: false).selectPage(2);

                  },
                  child: RotatedBox(quarterTurns: 1, child: Icon(Icons.expand, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.yellow.shade700, // <-- Button color
                  ),
                ),
                ProDsxRxProjector(
                    rxLabel: 'Projector 2',
                    rxId: '19',
                ),

              ],
            ),
          ]
      ),
    );


  }
}