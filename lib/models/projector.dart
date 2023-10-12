import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';

class ProDsxRxProjector extends StatelessWidget {
  //Constructor
  String rxLabel ;
  String rxId ;
  // String vwMode ;


  ProDsxRxProjector({
    required String this.rxLabel,
    required String this.rxId,
    // required String this.vwMode

  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              width: 150,
              height: 50*.9,
              child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.crop_original,
                    color: Colors.white,
                  ),
                  label: Text(
                    rxLabel,
                    style: TextStyle(
                      color: Colors.white,
                    ),

                  ),
                  style:  ElevatedButton.styleFrom(backgroundColor:Provider.of<RxStatus>(context,listen:true).vwStatus[int.parse(rxId)] != '1'? Colors.transparent:Colors.yellow.shade700,

                      side: BorderSide(
                          color: Colors.white
                      )
                  ),

                  onPressed: () {
                    Provider.of<PageSelect>(context,listen: false).selectPage(2);
                    Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxId);

                  }
              ),
            ),
            Positioned(right:10, child: Text(rxId,style: TextStyle(color: Colors.white,fontSize: 10),)),
            Text(Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxId)]! ,style: TextStyle(color:Colors.white,fontSize: 12),),
            // Overlay for 'blackout'
            // Visibility(
            //   visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxId)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
            //   child: Container(
            //     width: 150,
            //     height: 50*.9,
            //     color: Colors.black.withOpacity(0.5),
            //   ),
            // )

          ]
      ),
    );
  }
}