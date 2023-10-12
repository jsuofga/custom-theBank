import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/models/prodsx_tx.dart';
import '../provider.dart';

class ProDsxInputSelects  extends StatefulWidget {
  const ProDsxInputSelects  ({Key? key}) : super(key: key);

  @override
  _ProDsxInputSelects  createState() => _ProDsxInputSelects  ();
}

class _ProDsxInputSelects extends State<ProDsxInputSelects> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  GestureDetector(
      onTap: (){
        Provider.of<PageSelect>(context,listen: false).selectPage(0);
      },
      child: Container(
        color: Colors.transparent,
        child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[Text('Video Sources',style:TextStyle(color: Colors.white,fontSize: 20),)]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProDsxTx(txLabel: 'Video 1', chId: "001",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0, color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 2',chId: "002",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 3',chId: "003",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 4',chId: "004",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,))
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProDsxTx(txLabel: 'Video 5', chId: "005",child: Icon(Icons.settings_input_hdmi_sharp , size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 6',chId: "006",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 7',chId: "007",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 8',chId: "008",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,))
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProDsxTx(txLabel: 'Video 9', chId: "009",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Video 10',chId: "0010",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Bank DJ',chId: "0011",child: Icon(Icons.spatial_audio, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Vault DJ',chId: "0012",child: Icon(Icons.spatial_audio, size: 20.0,color: Colors.white,))
                  ],

                ),


              ],
            )
        ),
      ),
    );


  }
}