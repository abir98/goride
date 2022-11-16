import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class hometabpage extends StatefulWidget {
  const hometabpage({Key? key}) : super(key: key);

  @override
  State<hometabpage> createState() => _hometabpageState();
}

class _hometabpageState extends State<hometabpage> {
  bool Isloading = false ;
  late List<String> AutocompleteData ;


  Future FetchAutoCompletedata() async
  {
   setState(() {
     Isloading = true ;

   });

   final String  StringData =  await rootBundle.loadString("Assets/data.json");
   final List<dynamic> list = jsonDecode(StringData);
   final List<String>  JsonStringdata = list.cast<String>();


   setState(() {
     Isloading = false;
     AutocompleteData = JsonStringdata;
   });
  }
  Widget DriverdetailCard(){
    return Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            child: Padding(padding: const EdgeInsets.all(8),
                child:Row(
                  children: [
                    Padding(padding:const EdgeInsets.all(8),
                      child: Container(
                        width:100 ,
                        height: 100,
                         decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                          image:DecorationImage(image:AssetImage("Assets/avatar.jpg"),
                          fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name", style:TextStyle(fontSize: 18,color: Colors.blue)),
                        Text("Phone number",style:TextStyle(fontSize: 18,color: Colors.blue)),
                      ],
                    )
                  ],
                ))

          ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchAutoCompletedata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Isloading? const
      Center(child: CircularProgressIndicator()):
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children :[
                SizedBox(height: 30),
                Text('Search for your Ride',style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold,color: Colors.blue),),
                SizedBox(height:30),
                Autocomplete(optionsBuilder: (TextEditingValue TexteditingValue) {
                  if (TexteditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  else {
                    return AutocompleteData.where((element) =>
                        element.toLowerCase().contains(
                            TexteditingValue.text.toLowerCase()));
                  }
                }, fieldViewBuilder:(context, controller, focusNode, onEditingcComplete) {
    return TextField(
    controller: controller,
    focusNode: focusNode,
    onEditingComplete: onEditingcComplete,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey),),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.blueGrey),),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey),),
    prefixIcon: Icon(Icons.search),
    hintText: "From"));}
                ),
                SizedBox(
                  height: 15,
                ),

                Autocomplete(optionsBuilder: (TextEditingValue TexteditingValue) {
                  if (TexteditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  else {
                    return AutocompleteData.where((element) =>
                        element.toLowerCase().contains(
                            TexteditingValue.text.toLowerCase()));
                  }
                }, fieldViewBuilder:(context, controller, focusNode, onEditingcComplete) {
                  return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingcComplete,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blueGrey),),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey),),
                          prefixIcon: Icon(Icons.search),
                          hintText: "To"));}
                ),
                SizedBox(height: 20),

                Text(" Available Rides " ,style:TextStyle(fontSize: 22 , fontWeight: FontWeight.bold,color: Colors.blue),
               ),
               DriverdetailCard(),
              ]

            ),
          ),



    );

  }
}
