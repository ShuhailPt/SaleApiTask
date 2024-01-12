import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_vikn/MyColors.dart';

import '../Controller.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());

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
                padding: const EdgeInsets.fromLTRB(20, 120,20,80),
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
                        border: Border.all(color: const Color(0xffE6E6E6))
                      ),
                      child: const Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: ImageIcon(AssetImage("assets/user.png"),color: Color(0xff0A9EF3),size: 26,),
                              labelText: 'Username',
                              border: InputBorder.none,
                            ),
                            // controller: usernameController, // Use TextEditingController
                          ),
                          Divider(color:Color(0xffE6E6E6) ,),
                          TextField(
                            inputFormatters: [

                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: ImageIcon(AssetImage("assets/key.png"),color: Color(0xff0A9EF3),),
                              labelText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.visibility_outlined,color: Color(0xff0A9EF3),)

                            ),
                            // controller: passwordController, // Use TextEditingController
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 29,),
                    const Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff0A9EF3)
                        )
                    ),

                    const SizedBox(height: 15.0),

                    ElevatedButton(

                        style:ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0E75F4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            maximumSize: const Size(130,50),
                        ),

                        onPressed: (){

                          controller.ssss();



                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                          Get.to(HomePage());
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
              const Padding(
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
                          color: Color(0xff0A9EF3),
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