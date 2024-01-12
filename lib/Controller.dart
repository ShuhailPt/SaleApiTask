import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ModelClass.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController{

  // List<Invoice> invoiceList=[];
  List invoiceList =<Invoice>[].obs;

  ssss() async {
    print("helloo suhaolll");
    // Login API endpoint
    final loginUrl = 'https://api.accounts.vikncodes.com/api/v1/users/login';
    final username = 'Rabeeh@vk';
    final password = 'Rabeeh@000';
    final isMobile = true;

    // Sale list API endpoint
    final saleListUrl = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';

    // Login request
    final loginResponse = await login(username, password, isMobile, loginUrl);

    // Check if login was successful
    if (loginResponse.statusCode == 200) {
      log(loginResponse.body.toString());

      final accessToken = jsonDecode(loginResponse.body)['data']['access'];

      // Save access token in SharedPreferences
      saveAccessToken(accessToken);

      // Use access token for subsequent API requests
      if (accessToken != null) {
        final saleListResponse = await getSaleList(accessToken, saleListUrl);

        if (saleListResponse.statusCode == 200) {
          // Handle the sale list response accordingly
          print('Sale list response: ${saleListResponse.body}');
        } else {
          // Handle sale list request errors
          print('Error fetching sale list. Status Code: ${saleListResponse.statusCode}');
          print('Response: ${saleListResponse.body}');
        }
      } else {
        print('Access token is null. Unable to make sale list request.');
      }
    } else {
      // Handle login errors
      print('Login failed. Status Code: ${loginResponse.statusCode}');
      print('Response: ${loginResponse.body}');

    }
  }

  Future<http.Response> login(String username, String password, bool isMobile, String url) async {
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
      'is_mobile': isMobile,
    };

    try {
      return await http.post(
        Uri.parse(url),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      throw Exception('Error during login request: $e');
    }
  }

  Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken ?? '');
  }

  getSaleList(String accessToken, String url) async {
    Map<String, dynamic> requestBody = {
      'BranchID': 1,
      'CompanyID': '1901b825-fe6f-418d-b5f0-7223d0040d08',
      'CreatedUserID': 62,
      'PriceRounding': 3,
      'page_no': 1,
      'items_per_page': 10,
      'type': 'Sales',
      'WarehouseID': 1,
    };

    try {
      var response= await http.post(
        Uri.parse(url),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      if(response.statusCode==200){
        Map<String, dynamic> parsedJson = jsonDecode(response.body);

        List<dynamic> dataList = parsedJson['data'];
        invoiceList = dataList.map((json) => Invoice.fromJson(json)).toList();




        for (var invoice in invoiceList) {
          print(invoice.voucherNo+'hiiii');
        }









        print("wiseeeeeeeeeeeeeeeeeeee");
        print(response.body.toString()+"helloo");
        print("suhaaaaaaaaaaail");

      }

    } catch (e) {
      throw Exception('Error during sale list request: $e');
    }


  }
}