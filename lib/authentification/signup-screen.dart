import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goride/authentification/login-screen.dart';
import 'package:goride/widgets/progress_dialog.dart';

class signupScreen extends StatefulWidget {


  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController nametexteditingcontroller = TextEditingController();
  TextEditingController emailtexteditingcontroller = TextEditingController();
  TextEditingController passwordtexteditingcontroller = TextEditingController();


   validateForm() {
     if (nametexteditingcontroller.text.length < 3) {
       Fluttertoast.showToast(msg: " Name must be at least 3 characters");
     }
     else if (!emailtexteditingcontroller.text.contains("@")) {
       Fluttertoast.showToast(msg: "Email incorrect");
     }
     else if (passwordtexteditingcontroller.text.length < 6) {
       Fluttertoast.showToast(msg: "Password must be at least 6 characters");
     }

     else {
       showDialog(context: context,
           barrierDismissible: false,
           builder: (BuildContext c) {
             return Progress_dialog(message: 'We are registering ...please wait');
           });
     }
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('Assets/driver.png'),

              const Text(" Register as a driver",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 12.0,
              ),
                 TextField(
                   style: const TextStyle(fontSize: 20),
                   controller: nametexteditingcontroller,
                   decoration: InputDecoration(
                     labelText: "Full Name",

                     enabledBorder:OutlineInputBorder(
                       borderSide:const BorderSide(color: Colors.lightBlue),
                       borderRadius: BorderRadius.circular(10.0)
                     ),
                     labelStyle: const TextStyle(color: Colors.lightBlue,
                     fontSize: 20,fontWeight: FontWeight.bold)

                   ),
                 ),
              const SizedBox(
                height: 12.0,
              ),
                 TextField(
                style: const TextStyle(fontSize: 20),
                controller: emailtexteditingcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",

                    enabledBorder:OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    labelStyle: const TextStyle(color: Colors.lightBlue,
                        fontSize: 20,fontWeight: FontWeight.bold)

                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
                 TextField(
                style:  const TextStyle(fontSize: 20),
                controller: passwordtexteditingcontroller,
                keyboardType: TextInputType.text,
                obscureText: true,

                decoration: InputDecoration(
                    labelText: "Password",

                    enabledBorder:OutlineInputBorder(
                        borderSide:const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    labelStyle: const TextStyle(color: Colors.lightBlue,
                        fontSize: 20,fontWeight: FontWeight.bold)

                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
                 
              ElevatedButton(onPressed: (){
                validateForm();
              },style:ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue),child:const Text("Create account",style: TextStyle(color:Colors.white,
              fontSize: 18),)),
              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
              },
                  child: const Text(" Already have an account ? Login here ") )

            ],
          ),
        ),

      ),

    );
  }
}
