import 'package:flutter/material.dart';
import 'package:goride/authentification/loginclient.dart';
import 'package:goride/authentification/signup-screen.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailtexteditingcontroller = TextEditingController();
  TextEditingController passwordtexteditingcontroller = TextEditingController();

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
            const SizedBox(
              height: 20.0,
            ),
            const Text(" Login as a driver",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              style: const TextStyle(fontSize: 20),
              controller: emailtexteditingcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",

                  enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelStyle: const TextStyle(color: Colors.lightBlue,
                      fontSize: 20,fontWeight: FontWeight.bold)

              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              controller: passwordtexteditingcontroller,
              keyboardType: TextInputType.text,
              obscureText: true,

              decoration: InputDecoration(
                  labelText: "Password",

                  enabledBorder:OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelStyle: const TextStyle(color: Colors.lightBlue,
                      fontSize: 20,fontWeight: FontWeight.bold)

              ),
            ),const SizedBox(
              height: 20.0,
            ),

            ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue),child:const Text(" Login ",style: TextStyle(color:Colors.white,
                fontSize: 18),)),
            TextButton(
                onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => signupScreen()));
            },
                child: const Text(" Don't have an account ? Sign Up here ") ),

             ElevatedButton(onPressed:(){
               Navigator.push(context,MaterialPageRoute(builder: (context) => loginclient()) ,
               );

             },style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                 child: const Text("Login as a client ", style:TextStyle(
                   color: Colors.white,fontSize: 18)
                 ))

          ],
        ),
      )
      ),
    );
  }
}

