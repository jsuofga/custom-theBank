import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class PageSelect extends ChangeNotifier{
  int page = 0;  //Home page

  selectPage(_page){
    page = _page;
    print('page:${page}');
    notifyListeners();
  }
}
class SwitchProDsxRX extends ChangeNotifier {
  String chID = '001'; //
  String rxID = '1';
  int vwType = 1;
  int startRX = 0;
  int endRX = 0;
  List chSelects = [];


  selectRx(_rxID) async {
    print('selectRx:${_rxID}');

    // Save selected rxID
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rxID', _rxID);
    await prefs.setInt('vwType', 1);
  }
  selectPillar(_pillarStartRX) async{
    print('start RX of Pillar:${_pillarStartRX}');

    // Save selected pillar
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startRX', int.parse(_pillarStartRX));
    await prefs.setInt('vwType', 4);

  }
//
  switchRx(_chID) async {

    chID = _chID;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rxID = await prefs.getString('rxID') ?? '';
    vwType = await prefs.getInt('vwType')?? 0 ;
    startRX = await prefs.getInt('startRX')?? 0 ;
    // endRX = await prefs.getInt('endRX')?? 0;

    if( vwType == 1){
      http.get(Uri.parse('http://172.31.3.${rxID}/cgi-bin/query.cgi?cmd=vw:off'));
      http.get(Uri.parse('http://172.31.3.${rxID}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));

    }else if( vwType == 2){
      //
      //  for(int i = 0; i<=1;i++){
      // Edge case, merge Rx15 and Rx19 ( non-consecutive)

         print('http://172.31.3.${startRX}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${0}%3Be%20e_vw_moninfo_200_200_100_100');
         http.get(Uri.parse('http://172.31.3.${startRX}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${0}%3Be%20e_vw_moninfo_200_200_100_100'));
         http.get(Uri.parse('http://172.31.3.${startRX}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));

         print('http://172.31.3.${19}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${1}%3Be%20e_vw_moninfo_200_200_100_100');
         http.get(Uri.parse('http://172.31.3.${19}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${1}%3Be%20e_vw_moninfo_200_200_100_100'));
         http.get(Uri.parse('http://172.31.3.${19}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));



    }else if( vwType == 4){ // merge TV 1-4
      for(int i = 0; i<= 3;i++) {
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${i}%3Be%20e_vw_moninfo_200_200_100_100'));
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));
      }
    }

  }
//
  mergeRx(int _vwType, int _startRX, int _endRX,) async {
     int vwType = _vwType;
     int startRX = _startRX;
     int endRX = _endRX;

     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setInt('vwType', vwType);
     await prefs.setInt('startRX', startRX);
     await prefs.setInt('endRX', endRX);

     print(vwType);

  }

  blackout_resume_video(int _zone,String _param) async{

    const List rxIDs_bank = [
      10, 11, 12,13, 14, 15,19, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46
    ];

    const List rxIDs_vault = [
      1, 2, 3, 4, 5, 6, 7, 8, 9,16,
    ];

    String param = _param;  //'2' = black out, '0' = resume video

    //Bank
    if(_zone == 1){
      rxIDs_bank.asMap().forEach((index, item) async {
        try {
            // print('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause');
            http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause'));
          } catch (error) {

        }
    });
      //Vault
      }else if(_zone == 3){
      rxIDs_vault.asMap().forEach((index, item) async {
        try {
          // print('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause');
          http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause'));
        } catch (error) {

        }
      });

    }

  }


 }
//

// Prodsx Status
class RxStatus extends ChangeNotifier {
   List rxIDs = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 14, 15, 16, 19, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46
  ];

   final List rxIDs_bank = [
    10, 11, 12,13, 14, 15,19, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46
  ];

  final List rxIDs_vault = [
   1, 2, 3, 4, 5, 6, 7, 8, 9,16,
  ];

  final List sourceList = [
    'Video1', 'Video2', 'Video3', 'Video4', 'Video5', 'Video6', 'Video7', 'Video8', 'Video9', 'Video10', 'BankDJ', 'VaultDJ'
  ];

  Map chSelects = {
    1:'Search',2:'Search',3:'Search',4:'Search',5:'Search',
    6:'Search',7:'Search',8:'Search',9:'Search',10:'Search',
    11:'Search',12:'Search',13:'Search',14:'Search',
    15:'Search', 16:'Search',19:'Search',
    23:'Search',24:'Search',25:'Search',26:'Search',27:'Search',
    28:'Search',29:'Search',30:'Search',31:'Search',32:'Search',
    33:'Search',34:'Search',35:'Search',36:'Search',37:'Search',
    38:'Search',39:'Search',40:'Search',41:'Search',42:'Search',
    43:'Search',44:'Search',45:'Search',46:'Search',
  };

  Map vwStatus = {
    15: '0', 16: '0', 23: '0', 24: '0', 25: '0', 26: '0',
    27: '0', 28: '0', 29: '0', 30: '0', 31: '0', 32: '0',
    33: '0', 34: '0', 35: '0', 36: '0', 37: '0', 38: '0',
    39: '0', 40: '0', 41: '0', 42: '0', 43: '0', 44: '0',
    45: '0', 46: '0',
  };

   Map blackoutStatus = {
     1:'0',2:'0',3:'0',4:'0',5:'0',
     6:'0',7:'0',8:'0',9:'0',10:'0',
     11:'0',12:'0',13:'0',14:'0',
     15:'0', 16:'0', 23:'0', 24:'0', 25:'0', 26:'0',
     27:'0', 28:'0', 29:'0', 30:'0', 31:'0', 32:'0',
     33:'0', 34:'0', 35:'0', 36:'0', 37:'0', 38:'0',
     39:'0', 40:'0', 41:'0', 42:'0', 43:'0', 44:'0',
     45:'0', 46:'0',
   };


   getFeedback(_bank_vault) async {
    if(_bank_vault == 'bank'){
      rxIDs = [...rxIDs_bank];
    }else if(_bank_vault =='vault'){
      rxIDs = [...rxIDs_vault];
    }
    RegExp regex_ch_select = RegExp(r'ch_select=(\S+)');
    RegExp regex_max_column = RegExp(r'max_column=(\S+)');

    rxIDs.asMap().forEach((index, item) async {
      try {
        //check maximum number of columns of RX '0' = not VW , '1' = 1x2 VW mode, '3'= 1x3 VW mode'
        // var response = await http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=astparam g ch_select'));
        var response = await http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=astparam dump'));
        // print(response.body);
        // Extract ch_select and max_column data from astparam dump
        Match? match_ch_select = regex_ch_select.firstMatch(response.body);
        Match? match_max_column = regex_max_column.firstMatch(response.body);

        // Check if a match was found.
        if (match_ch_select != null && match_max_column != null) {
          // Extract the data after 'ch_select'.
          String chSelectData = match_ch_select.group(1)!;
          String maxColumnData = match_max_column.group(1)!;

          chSelects[item] = sourceList[int.parse(chSelectData.substring(3)) - 1];
          vwStatus[item] = maxColumnData;
          notifyListeners();
        }

      } catch (error) {
        chSelects[item] = 'Error'; //
        notifyListeners();
      }

    });
    // Check if RX is 'blackout' or 'playing' . '0' = playing, '2' = blackout
    // rxIDs.asMap().forEach((index, item) async {
    //   try {
    //     var response = await http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=cat /sys/devices/platform/videoip/pause'));
    //
    //     blackoutStatus[item] = response.body;
    //       // print(response.body.length);  // for debugging. The endpoint actually returns string with length of 2! . Expected length of 1. So must be including special character!
    //       // print(blackoutStatus);
    //       notifyListeners();
    //     }catch (error) {
    //       blackoutStatus[item] = 'Error'; //
    //       notifyListeners();
    //   }
    //
    // });


  }
}


