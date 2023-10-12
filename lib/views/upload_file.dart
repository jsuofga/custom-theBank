import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Uploadfile extends StatefulWidget {
  const Uploadfile({Key? key}) : super(key: key);

  @override
  _UploadfileState createState() => _UploadfileState();
}

class _UploadfileState extends State<Uploadfile> {
  bool showSelectDistTar = true;
  bool showUpload = false;
  bool uploading = false;
  bool uploadFinished= false;
  String userPrompt = 'Please load the dist.tar file provided';
  late List<int> _selectedFile;
  late Uint8List _bytesData ;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.draggable = false;
    uploadInput.accept = '.tar';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files?[0];
      final reader = new html.FileReader();

      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result!);
      });
      reader.readAsDataUrl(file as html.Blob);

      setState(() {
        showSelectDistTar = false;
        showUpload = true;


      });
    });
  }
  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }
  Future makeRequest() async {
    var url = Uri.parse("http://${html.window.location.hostname.toString()}:1880/update");
    var request = new http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromBytes(
        'file', _selectedFile,
        contentType: new MediaType('application', 'x-tar'),
        filename: "dist.tar"));

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200){
        print("Uploaded!");
        setState(() {
          showUpload = false;
          uploading = false;
          uploadFinished = true;
          Provider.of<PageSelect>(context,listen: false).selectPage(0);
        });

        html.window.location.reload(); //reload the browser so can see updated page automatically

      }

    });

  }


  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(visible: showSelectDistTar, child: Text('Select the dist.tar file provided',style: TextStyle(color: Colors.white, fontSize: 26),)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Visibility(
                  visible: uploading,
                  child: SpinKitWave(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ),
              ),
              Visibility(visible: uploading, child: Text('dist.tar file - Uploading',style: TextStyle(color: Colors.white, fontSize: 26),)),
              Visibility(visible: uploadFinished, child: Text('Done',style: TextStyle(color: Colors.white, fontSize: 26),)),
              new Form(
               // autovalidate: true,
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 28),
                  child: new Container(
                      width: 350,
                      child: Column(
                          children: [
                            Visibility(
                              visible:!showUpload,
                              child: ElevatedButton( child: Text("Select File"),
                                onPressed: (){
                                  startWebFilePicker();
                                  setState(() {
                                    showSelectDistTar = false;
                                  });
                              },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Visibility(
                                visible: showUpload && !uploading,
                                child: Column(
                                  children: [
                                    Text('dist.tar', style: TextStyle(color: Colors.white),),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton( child: Text("Upload File"),

                                        onPressed: (){
                                         setState(() {
                                           uploading = true;
                                         });
                                          makeRequest();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ]
                      )
                  ),
                ),
              )

            ],
          ),
        )

      );
 }
}