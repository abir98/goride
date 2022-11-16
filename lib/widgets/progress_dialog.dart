import 'package:flutter/material.dart';

class Progress_dialog extends StatelessWidget {
 String? message;
 Progress_dialog({this.message});


  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: Container(
       margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(padding: const
          EdgeInsets.all(15.0),
          child: Row(
            children: [
              const SizedBox(width: 3.0,),
              const CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(width : 26.0),
              Text(message!,
                style: const TextStyle(
                   color: Colors.black,
                  fontSize: 14,

                ),
              )

            ],

          ),
        ),
      ),
        );
  }
}
