import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_vikn/MyColors.dart';

import '../controllers/Controller.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {


    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Container(
      height: heighth,
      width: widthh,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.3, 0.7, 1],
          colors: [
            Bwhite,
            Byellow,
            BlightBlue,
            BlightPink,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 55, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage("assets/lang.png"),
                      height: 24, // Adjust the height as needed
                      width: 24,  // Adjust the width as needed
                    ),
                    SizedBox(width: 8.0),
                    Text(
                        "English",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 130,20,120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:FontWeight.w500
                        )
                    ),
                    Text(
                        "Login to your vikn account",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Bgrey,
                        )
                    ),
                    const SizedBox(height: 27,),
                    Container(
                      decoration: BoxDecoration(
                        color: Bwhite,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:lineColor)
                      ),
                      child:  Column(
                        children: [
                          TextField(
                            controller: counterController.cUsername,
                            decoration: InputDecoration(
                              prefixIcon: ImageIcon(const AssetImage("assets/user.png"),color: blue,size: 26,),
                              labelText: 'Username',
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(color:lineColor ,),
                          TextField(

                            controller: counterController.cPassword,
                            obscureText: counterController.visivility,
                            decoration: InputDecoration(
                                prefixIcon: ImageIcon(AssetImage("assets/key.png"),color:blue,),
                                labelText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.visibility_outlined,color:blue,),
                                  onPressed: () {
                                    counterController.visible(!counterController.visivility);
                                  },
                                )

                            ),
                          )



                        ],
                      ),
                    ),
                    const SizedBox(height: 29,),
                    Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: blue
                        )
                    ),

                    const SizedBox(height: 15.0),

                     counterController.loader?CircularProgressIndicator():ElevatedButton(

                        style:ElevatedButton.styleFrom(
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            maximumSize: const Size(130,50),
                        ),

                        onPressed: (){
                          counterController.loginForm(counterController.cUsername.text.toString(),counterController.cPassword.text.toString());
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }, child: const Center(
                          child: Row(
                            children: [
                              Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )
                              ),
                              SizedBox(width: 3,),
                              Icon(Icons.arrow_forward,color: Colors.white,)
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Text(
                        "Don’t have an Account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    Text(
                        "Sign up now!",
                        style: TextStyle(
                          color: blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}