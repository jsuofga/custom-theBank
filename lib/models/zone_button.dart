import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';

class ZoneButton extends StatelessWidget {
  //Constructor
  String zoneLabel ;
  int zone ;  //1 for zone 1, 2 for zone 2
  int pageIndexWhenSelected ;
  
  ZoneButton({
    required String this.zoneLabel,
    required int this.zone,
    required int this.pageIndexWhenSelected
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
          height:200,width: 200,
          child:ElevatedButton(
            onPressed: (){
              Provider.of<PageSelect>(context,listen: false).selectPage(pageIndexWhenSelected);
            },
            child: Text(zoneLabel,style: TextStyle(color: Colors.white, fontSize: 30),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                    side: BorderSide(color:Colors.white,width:1)
                  //border radius equal to or more than 50% of width
                )
            ),
          )
      ),
    );
  }
}