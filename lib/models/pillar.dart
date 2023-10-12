
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';

class Pillar extends StatelessWidget {
  //Constructor
    String pillarID ;
    String startRX;
    String rxID_top;
    String rxID_left;
    String rxID_right;
    String rxID_bottom;
    //
  Pillar({
    required String this.startRX,
    required String this.pillarID,
    required String this.rxID_top,
    required String this.rxID_left,
    required String this.rxID_right,
    required String this.rxID_bottom,

  });

      double _width = 75;
      double _height = 45;

  @override
  Widget build(BuildContext context) {

    return Container(
      // decoration: BoxDecoration(border: Border.all(color:Colors.red)),
      // padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: _width,height: _height,),
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                    SizedBox(width: _width,height: _height*.75,
                      child: ElevatedButton(
                        style:  ElevatedButton.styleFrom(
                                  backgroundColor:Provider.of<RxStatus>(context,listen:true).vwStatus[int.parse(rxID_top)] != '3'? Colors.transparent:Colors.yellow.shade700,
                                  side: BorderSide(
                                  color: Colors.white
                            )),

                        child: Text(
                          Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxID_top)]!,
                          style: TextStyle(color: Colors.white,fontSize: 10),),
                        onPressed: (){
                          Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxID_top);
                          Provider.of<PageSelect>(context,listen: false).selectPage(2);
                        },
                      )
                  ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(rxID_top,style: TextStyle(color: Colors.white, fontSize: 9),),
                      ),
                      // overlay for blackout
                      // Visibility(
                      //   visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxID_top)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
                      //   child: Container(width: _width,height: _height*.75,
                      //     color: Colors.black.withOpacity(0.75),
                      //   ),
                      // )
                    ]
                ),
                SizedBox(width: _width,height: _height,),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children:[
                  RotatedBox(
                    quarterTurns: 1,
                    child: SizedBox(
                        width: _width,
                        height: _height*.75,
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(backgroundColor:Provider.of<RxStatus>(context,listen:true).vwStatus[int.parse(rxID_left)] != '3'? Colors.transparent:Colors.yellow.shade700,
                              side: BorderSide(
                                  color: Colors.white
                              )),

                          child: Text(
                            Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxID_left)]!,
                            style: TextStyle(color: Colors.white,fontSize: 10),),
                          onPressed: (){
                            Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxID_left);
                            Provider.of<PageSelect>(context,listen: false).selectPage(2);

                          },)
                    )
                ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: RotatedBox(quarterTurns: 1,
                        child: Text(rxID_left,style: TextStyle(color: Colors.white, fontSize: 9),)),
                  ),
                    // // overlay for blackout
                    // RotatedBox(
                    //   quarterTurns: 1,
                    //   child: Visibility(
                    //     visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxID_left)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
                    //     child: Container(
                    //       width: _width,height: _height*.75,
                    //       color: Colors.black.withOpacity(0.75),
                    //     ),
                    //   ),
                    // )

                  ]
              ),
              Container(
                width: _width*1,
                height: _height*1.2,
                margin: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade700),
                  label: Text('$pillarID'),
                  icon: Icon(Icons.cached),
                  onPressed: () {
                        Provider.of<SwitchProDsxRX>(context,listen: false).selectPillar(rxID_top);
                        Provider.of<PageSelect>(context,listen: false).selectPage(2);
                  },
                ),
              ),
              Stack(
                  alignment: AlignmentDirectional.topEnd ,

                  children:[
                  RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(width: _width,height: _height*.75,
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(backgroundColor:Provider.of<RxStatus>(context,listen:true).vwStatus[int.parse(rxID_right)] != '3'? Colors.transparent:Colors.yellow.shade700,
                              side: BorderSide(
                                  color: Colors.white
                              )),
                          child: Text(
                            Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxID_right)]!,
                            style: TextStyle(color: Colors.white,fontSize: 10),),
                          onPressed: (){
                            Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxID_right);
                            Provider.of<PageSelect>(context,listen: false).selectPage(2);

                          },)
                    )
                ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: RotatedBox(quarterTurns: 3, child: Text(rxID_right,style: TextStyle(color:Colors.white, fontSize: 9),)),
                  ),
                    // // overlay for blackout
                    // RotatedBox(
                    //   quarterTurns: 1,
                    //   child: Visibility(
                    //     visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxID_right)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
                    //     child: Container(
                    //       width: _width,height: _height*.75,
                    //       color: Colors.black.withOpacity(0.75),
                    //     ),
                    //   ),
                    // )

                  ]
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: _width,height: _height,),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children:[
                  SizedBox(
                    width: _width,
                    height: _height*.75,
                    child: ElevatedButton(
                      style:  ElevatedButton.styleFrom(backgroundColor:Provider.of<RxStatus>(context,listen:true).vwStatus[int.parse(rxID_bottom)] != '3'? Colors.transparent:Colors.yellow.shade700,
                          side: BorderSide(
                              color: Colors.white
                    )),
                      child: Text(
                        Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(rxID_bottom)]!,
                        style: TextStyle(color: Colors.white,fontSize: 10),),
                      onPressed: (){
                        Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(rxID_bottom);
                        Provider.of<PageSelect>(context,listen: false).selectPage(2);

                      },
                    )
                ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(rxID_bottom,style: TextStyle(color: Colors.white, fontSize: 9),),
                  ),
                  // overlay for blackout
                  // Visibility(
                  //   visible: Provider.of<RxStatus>(context,listen: true).blackoutStatus[int.parse(rxID_bottom)].contains('2'),  // 0 = play, 2 = blackout. Note data includes a space , legthth of data = 2. So use contains()
                  //   child: Container(
                  //     width: _width,height: _height*.75,
                  //     color: Colors.black.withOpacity(0.75),
                  //   ),
                  // )


                ]
              ),
              SizedBox(width: _width,height: _height,),
            ],
          )
        ],

      ),
    );
  }
}

//

