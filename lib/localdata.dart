import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSaveData extends StatefulWidget {
  const LocalSaveData({ Key? key }) : super(key: key);

  @override
  _LocalSaveDataState createState() => _LocalSaveDataState();

  static init() {}
  }
  
  class _LocalSaveDataState extends State<LocalSaveData> {
    final TextEditingController name = TextEditingController();
  
   String localStorage = "";
  
   static Future getName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var  localStorage  =  await SharedPreferences.getInstance();
  
       }
      
    @override
    // ignore: must_call_super
    void initState() { 
      super.initState();
      setState(() {
        getName();
      });
      
    }
     
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height:50),
            
              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                 
                                
                                   controller: name,
                                  //  onChanged: (text) {
                                  //   value = text;
                                  //  },
                                
                                  decoration: InputDecoration(
                                    hintText: 'Enter The Name.',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.pink, width: 2),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.mobile_friendly_rounded,
                                      color: Colors.grey[400],
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              RaisedButton.icon(onPressed: ()  {
                               
                              save();
                                
                               
                              }, label:Text("save the data"),
                              icon: Icon(Icons.storage),),
                              Padding(padding: EdgeInsets.only(top:40)),
                              if(localStorage!=null)
                              Text("Name : $name")
            ],
          ),
                          
        ),
        
      );
    }
    save() async{
      await LocalSaveData.init();
    localStorage.toString();

  }
}