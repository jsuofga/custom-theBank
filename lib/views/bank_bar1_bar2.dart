import 'package:flutter/material.dart';
import 'package:the_bank/models/prodsx_rx.dart';


class Bank_bar1_bar2 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              avatar: Icon(Icons.wine_bar_sharp,color: Colors.white,size: 16,),
              label: const Text('BAR2',style: TextStyle(color: Colors.white,fontSize: 16),),
              backgroundColor: Colors.grey[700],
              padding: EdgeInsets.fromLTRB(50,5,50,5),
            ),
            SizedBox(width: 150,),
            Chip(
              avatar: Icon(Icons.wine_bar_sharp,color: Colors.white,size: 16,),
              label: const Text('BAR1',style: TextStyle(color: Colors.white,fontSize: 16),),
              backgroundColor: Colors.grey[700],
              padding: EdgeInsets.fromLTRB(50,5,50,5),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProDsxRx(rxLabel: 'Bar1-TV1', rxId: '10'),
            ProDsxRx(rxLabel: 'Bar-TV2', rxId: '11'),
            SizedBox(width: 25,),
            ProDsxRx(rxLabel: 'Bar2-TV1', rxId: '12'),
            ProDsxRx(rxLabel: 'Bar2-TV2', rxId: '13'),

          ],
        ),

      ],
    );


  }
}