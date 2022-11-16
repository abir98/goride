
import 'package:flutter/material.dart';
import 'package:goride/authentification/signup-screen.dart';
import 'package:goride/authentification/signupclient.dart';
import 'package:goride/mainScreens/main_screen.dart';
import 'package:goride/tabPages/home_tab.dart';

class loginclient extends StatefulWidget {


  @override
  State<loginclient> createState() => _loginclientState();
}

class _loginclientState extends State<loginclient> {
  TextEditingController emailtexteditingcontroller = TextEditingController();
  TextEditingController passwordtexteditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Image.asset('Assets/client.jpg'),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(" Login as a client",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20 ,color: Colors.black),
                  controller: emailtexteditingcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      enabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      labelStyle: const TextStyle(color: Colors.amber,
                          fontSize: 20,fontWeight: FontWeight.bold)

                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: passwordtexteditingcontroller,
                  keyboardType: TextInputType.text,
                  obscureText: true,

                  decoration: InputDecoration(
                      labelText: "Password",

                      enabledBorder:OutlineInputBorder(
                          borderSide:const BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      labelStyle: const TextStyle(color: Colors.amber,
                          fontSize: 20,fontWeight: FontWeight.bold)

                  ),
                ),const SizedBox(
                  height: 20.0,
                ),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
                },style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber),child:const Text(" Login ",style: TextStyle(color:Colors.white,
                    fontSize: 18),)),
                TextButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const signupclient()));
                    },
                    child: const Text(" Don't have an account ? Sign Up here " ,style: TextStyle(color: Colors.amber),) ),

              ],
            ),
          )
      ),
    );

  }
}
