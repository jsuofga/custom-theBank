import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';


class ProDsxRx extends StatelessWidget {
  //Constructor
  String rxLabel ;
  String rxId ;

  ProDsxRx({
    required String this.rxLabel,
    required String this.rxId,

  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(right:10, child: Text(rxId,style: TextStyle(color: Colors.white,fontSize: 10),)),
          Text(Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxId)]! ,style: TextStyle(color:Colors.white,fontSize: 12),),
          SizedBox(
            width: 120,
            height: 40,
            child: TextButton.icon(
                icon: Icon(
                   Icons.tv,
                   color: Colors.white,
                ),
                label: Text(
                  rxLabel,
                  style: TextStyle(
                      color: Colors.white,

                  ),

                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color:Colors.white)
                    ),
                  ),

                ),
                onPressed: () {
                  Provider.of<PageSelect>(context,listen: false).selectPage(2);
                  Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxId);

                }
            ),
          ),
          // Overlay for 'blackout'
          // Visibility(
          //   visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxId)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
          //   child: Container(
          //     width: 120,
          //     height: 40,
          //     color: Colors.black.withOpacity(0.5),
          //   ),
          // )
        ],
        
      ),
    );
  }
}