import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final Controller myController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Sales Estimate",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
        ),
        actions: [
        IconButton(
          icon: Icon(Icons.add,color: Color(0xff0A9EF3),size: 32,),
          onPressed: () {

          },
        ),
        ],


      ),
      body: Column(
        children: [
          Container(
            color: Color(0xffE6E6E6),
            child: TextField(
              decoration: InputDecoration(
                prefix: Text("  "),
                focusColor: Color(0xffB4B4B4),
                labelText: '   Search',labelStyle: TextStyle(color: Colors.black38 ),
                suffixIcon: Icon(Icons.search_outlined,color: Color(0xffB4B4B4),size: 30,),
                border: InputBorder.none,
              ),
              // controller: usernameController, // Use TextEditingController
            ),
          ),
    SizedBox(height: 10,),
    Expanded(
      child: Obx(() => ListView.separated(

          separatorBuilder:(BuildContext context,int index) {

            print(myController.invoiceList.length.toString()+"sDBsd");

            return Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,


            );
          } ,
          itemCount: myController.invoiceList.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "#Invoice No",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      Text(
                          "Pending",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Customer Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                          text: const TextSpan(
                              text: "SAR.",
                              style: TextStyle(
                                  color: Color(0xff888888),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                    text: "10,000.00",
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 16))
                              ])),
                      // Text(
                      //     "SAR. 10,000.00",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w400,
                      //     )
                      // ),
                    ],),
                ],
              ),
            );

          }
      ),)
    ),


        ],
      ),
    );
  }
}
