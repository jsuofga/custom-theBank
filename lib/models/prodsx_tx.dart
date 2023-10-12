import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart%20';
import '../provider.dart';
import 'package:http/http.dart' as http;

class ProDsxTx extends StatefulWidget {
    // Constructor
        String txLabel;
        String chId;
        Widget child;

        ProDsxTx({
          super.key,
          required String this.txLabel,
          required String this.chId,
          required this.child
        });

  @override
  _ProDsxTxState createState() => _ProDsxTxState();
}

class _ProDsxTxState extends State<ProDsxTx > {
  late Timer _timer;
  Image captureImg = Image.asset('');

  @override

  initState() {
    //
    _timer =  Timer.periodic(const Duration(seconds: 3), (timer) {
      print('ProDsxTX Inputs');
      http.get(Uri.parse("http://172.31.2.${widget.chId.substring(2)}/cgi-bin/query.cgi?cmd=cd /www/images%3Becho jpg 60 1 > /dev/videoip%3Bsleep 1%3Bcat /dev/videoip > capture.jpg"));
      updateImg();

    });
    print("ProDsxTX Inputs initState Called");
  }

    updateImg() {
    setState(() {
      imageCache.clear();
      imageCache.clearLiveImages();
      captureImg = Image.network('http://172.31.2.${widget.chId.substring(2)}/images/capture.jpg?t=${DateTime.now().millisecond}');

    });
  }

  void dispose() {
    print('dispose ProDsxTX Inputs');
    _timer.cancel();
    super.dispose();
  }


  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children:[
        // capture.jpg from TX
        Container(
            height: 148,
            width: 148,
            child: ClipRRect(borderRadius:BorderRadius.circular(16), child: captureImg,)
        ),

          Container(
            height: 180,
            width:180,
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
                icon: Align(alignment:Alignment.bottomCenter,child: widget.child),
                label: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.txLabel,
                    style: TextStyle(
                        backgroundColor: Colors.grey[800],
                        color: Colors.white
                    ),

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
                Provider.of<SwitchProDsxRX>(context,listen: false).switchRx(widget.chId);
              }
          ),
        ),
      ),]
    );

  }
}
