import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razor_pay_app/Services/remote_services.dart';
import 'package:razor_pay_app/model/getTheData.dart';

class ProductController extends GetxController{
var user = <User>[].obs;

void fetchProducts() async{
  var products = RemoteServices.fetchUser();
  if(products != null){
    user.value = products as List<User>;
  }
}
}