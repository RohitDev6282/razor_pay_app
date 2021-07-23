import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart';
import 'package:razor_pay_app/controller/getApicontroller.dart';

class GetTheData extends StatefulWidget {
  const GetTheData({Key? key}) : super(key: key);

  @override
  _GetTheDataState createState() => _GetTheDataState();
}

class _GetTheDataState extends State<GetTheData> {
  final ProductController userController = Get.put(ProductController());

 Future getApiData() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Response response = await get(url);
    print(response.statusCode);
    if(response.statusCode ==200){
      print("success");
      final data = jsonDecode(response.body);
     final text = data;
     print(text);
    }else {
      print("Oops something went wrogn");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("get the data")),
        body: Container(child: ElevatedButton(onPressed: (){
          getApiData();

        }, child: Text("Get the Data")),));
        
        
        // ListView(children: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Expanded(
        //         child: Obx(() => StaggeredGridView.countBuilder(
        //             crossAxisCount:userController.user.length ,
        //             itemBuilder: (context, index) {
        //               return Container(height: 200,
        //               width: 100, color: Colors.red);
        //             },
        //             staggeredTileBuilder: (index) => const StaggeredTile.fit(1)))),
        //   )
        // ]));
  }
}
