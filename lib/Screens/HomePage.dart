import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_vikn/MyColors.dart';

import '../Controller.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   final CounterController counterController = Get.put(CounterController());
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
          icon: Icon(Icons.add,color:blue,size: 32,),
          onPressed: () {

          },
        ),
        ],


      ),
      body: Column(
        children: [
          Container(
            color: conWhite,
            child: TextField(
              decoration: InputDecoration(
                prefix: Text("  "),
                focusColor: hintText,
                labelText: '   Search',labelStyle: TextStyle(color: Colors.black38 ),
                suffixIcon: Icon(Icons.search_outlined,color:hintText,size: 30,),
                border: InputBorder.none,
              ),
            ),
          ),
    SizedBox(height: 10,),
    Expanded(
      child: Obx(() => ListView.separated(

          separatorBuilder:(BuildContext context,int index) {


            return Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,


            );
          } ,
          itemCount: counterController.invoiceList.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                          counterController.invoiceList[index].voucherNo ,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )
                      ),),
                      Obx(() =>  Text(
                          counterController.invoiceList[index].status ,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          )
                      ),)


                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
            counterController.invoiceList[index].customerName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),),
                      Obx(() => RichText(
                          text:TextSpan(
                              text: "SAR.",
                              style: TextStyle(
                                  color: richText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              children:  [
                                TextSpan(
                                    text: counterController.invoiceList[index].grandTotalRounded.toString(),
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 16))
                              ])),)


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
