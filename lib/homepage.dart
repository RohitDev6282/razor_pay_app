import 'dart:ffi';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:razor_pay_app/getdata/getdata.dart';
import 'package:razor_pay_app/internetspeeed/internetspeed.dart';
import 'package:razor_pay_app/localdata.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  late Razorpay razorpay;
  TextEditingController textEditingController = TextEditingController();
  

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailur);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut(){
    var options = {
      "key":"rzp_test_DfA6uIElPypJtN",
      "amount" : num.parse(textEditingController.text)*100,
      "name": "Rohit aingh",
      "description": "Payment for the Total shopping",
      "profile": {
        "contact": "1231323132",
        "email":"Rohitdev6282@gmail.com"
      },
      "external":{
        "wallet": ["paytm"]
      }
    };
    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    } 
  }

  void handlerPaymentSuccess(){
    print("Payment sucess");
  
  }

  void handlerErrorFailur(){
    print("payment error");
    
  }
   void handlerExternalWallet(){
    print("external wallet");
    
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Razor pay")
      ),
      drawer: Drawer(),
      body:ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              labelText: 'Enter the name',
                              labelStyle: TextStyle(fontSize: 18),
                            ),
                            // controller: passwordController,
                            // validator: validatepassword,
                          ),
                        ),
              ),
               RaisedButton(onPressed: (){
                 openCheckOut();
               },
               color: Colors.blue,
               child:Text("Pay",
               style:TextStyle(color: Colors.white,fontSize: 20)),
               ),
           SizedBox(height:20),



               RaisedButton(onPressed: (){
                 Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => InternetSpeedCheck()));
               },
               child: Text("Check internet Speed",
                style:TextStyle(color: Colors.white,fontSize: 20)),
               color: Colors.redAccent,
               ),
                SizedBox(height:20),
               

               RaisedButton(onPressed: (){
                 Navigator.push(context, new MaterialPageRoute(builder:(context)=>GetTheData()));
               },
               color:Colors.blue,
               child: Text("Get the data list",
                style:TextStyle(color: Colors.white,fontSize: 20)),),
              
 SizedBox(height:20),
              
               
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: RaisedButton(
                          onPressed: ()async{
                             Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          LocalSaveData()));   
                               
                            },
                          
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                            child: Text(
                              'Local data save page',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          color: Colors.pink,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                       SizedBox(height:20), 
                       Container(child:_isLoggedIn?
      Column(
        children: [
          Text(_userObj.email),
            Text(""),
            TextButton(onPressed: (){}, child: Text("LogOut"))
        ],
      ):Center(child: ElevatedButton(child: Text("Login with Google"),
      onPressed: (){
        _googleSignIn.signIn().then((userData){
          setState(() {
            _isLoggedIn = true;
            _userObj = userData!;
          });
        });
      }
      ,),)),

            //            FlatButton(onPressed: (){
            //                Navigator.push(
            // context, MaterialPageRoute(builder: (context) => SecondPage()));  
            //            }, child: Text("Second page"))                
            ],
           
          ),
        ],
      ),
      
    );
  }
}

