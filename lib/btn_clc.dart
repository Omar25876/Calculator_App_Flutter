import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({required this.dig,this.btncolor=Colors.deepPurple,required this.OnCliked});
  String dig;
  Function OnCliked;
  Color btncolor;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
      child: ElevatedButton(onPressed: () {
        if(dig == '='){
          OnCliked();
        }
        else{
          OnCliked(dig);
        }

      },
          child: Text('$dig',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ) ,
          ),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(btncolor),
        ),
      ),
    );
  }
}
