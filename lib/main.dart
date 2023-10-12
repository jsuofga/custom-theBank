import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';
import 'package:the_bank/views/zone_select.dart ';
import 'package:the_bank/views/bank.dart';
import 'package:the_bank/views/vault.dart';
import 'package:the_bank/views/prodsx_input_selects.dart';
import 'package:the_bank/views/admin_access.dart';
import 'package:the_bank/views/upload_file.dart';


void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => PageSelect()),
        ChangeNotifierProvider( create: (context) => SwitchProDsxRX()),
        ChangeNotifierProvider( create: (context) => RxStatus()),
      ],
      child:  MaterialApp(
          title:'The Bank',
          debugShowCheckedModeBanner: false,
          home:  HomePage()
      ),
    ));


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final List _pageList = [Zoneselect(),Bank(),ProDsxInputSelects(),Vault(),AdminAccess(),Uploadfile()];
  // final List _pageList = [Zoneselect(),Bank(),ProDsxInputSelects(),Vault()];


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 100,),
            Text('Design By',style: TextStyle(
                color: Colors.black ,
                fontSize: 10
            ),),
            Image.asset('assets/andmt_logo.png', width: 60, height: 60,),
          ],

        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10,5,10),
            child: Text('V1.3', style: TextStyle(color: Colors.black),),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Provider.of<PageSelect>(context,listen: false).selectPage(4); // Show Admin Access Page
                },
                child: Icon(
                  Icons.upload_outlined,
                  color: Colors.black,
                ),
              )
          ),

        ],
      ),
      backgroundColor: Colors.grey[800],
      body:   _pageList[Provider.of<PageSelect>(context,listen: true).page],
      bottomNavigationBar: Container(
          height: 40,
          color:Colors.black26 ,
          child:Center(
              child: IconButton(icon: Icon(Icons.workspaces_filled, size:36,color: Colors.white,),
                onPressed: () {
                  Provider.of<PageSelect>(context,listen: false).selectPage(0);
                },
              ))
      ),
      // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
