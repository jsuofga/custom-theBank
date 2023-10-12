import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bank/provider.dart';

class AdminAccess extends StatefulWidget {
  const AdminAccess({Key? key}) : super(key: key);

  @override
  _AdminAccessState createState() => _AdminAccessState();
}

class _AdminAccessState extends State<AdminAccess> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:40.0),
              Text('ADMIN Password',style: TextStyle(color: Colors.white),),
              Container(
                width:600,
                color: Colors.white,
                child: TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        // icon:Icon(Icons.person),
                        hintText: 'Enter Admin Password',
                        labelText: ''
                    ),
                    onChanged: (val){

                    },
                    validator: (val) {
                      //Regular Expression check of IP address
                      if(val != 'octava'){
                        return 'Enter valid Admin Password';
                      }else{
                        setState(() {

                        });
                        return null;
                      }
                    }
                ),
              ),

              Container(
                padding: EdgeInsets.all(50),
                width:400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        icon: Icon(Icons.close),
                        label: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          primary:Colors.red,
                        ),
                        onPressed: () {
                          Provider.of<PageSelect>(context,listen: false).selectPage(0);
                        }
                    ),
                    ElevatedButton.icon(
                        icon: Icon(Icons.check),
                        label: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          primary:Colors.green,
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid,do the following:
                            Provider.of<PageSelect>(context,listen: false).selectPage(5);//show FileUpload form page

                          }else{

                          }
                        }
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}