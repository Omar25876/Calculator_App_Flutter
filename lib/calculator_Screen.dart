import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'btn_clc.dart';

class CalculatorScreen extends StatefulWidget {
   CalculatorScreen();
  static String routeName = 'CalculatorScreen';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
   String result ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text('Calculator',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,1,1,1),
                    child: Text('$result',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,),),
                  ),
                ],
              )
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ButtonComponent(dig: '7',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '8',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '9',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '*',btncolor: Colors.purpleAccent.shade400,OnCliked: OnOperatorClick,)),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ButtonComponent(dig: '4',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '5',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '6',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '-',btncolor: Colors.purpleAccent.shade400,OnCliked: OnOperatorClick,)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ButtonComponent(dig: '1',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '2',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '3',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '+',btncolor: Colors.purpleAccent.shade400,OnCliked: OnOperatorClick,)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ButtonComponent(dig: '.',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '0',OnCliked: OnDigClick,)),
                Expanded(child: ButtonComponent(dig: '=',btncolor: Colors.purple.shade700,OnCliked: EqualClicked,)),
                Expanded(child: ButtonComponent(dig: '/',btncolor: Colors.purpleAccent.shade400,OnCliked: OnOperatorClick,)),
              ],
            ),
          ),
        ],
      ),
    );

  }

   void OnDigClick(String digit){
    if(digit == '.'&& result.contains('.')){return ;}
     setState(() {
       result += digit;
     });

   }
   String operator = '';
   String lhs = '';
   void OnOperatorClick(String ClickOperator){
    if(operator.isEmpty){
      lhs = result;
      operator = ClickOperator;

    }
    else
    {
     lhs = Calculate(double.parse(lhs),ClickOperator,double.parse(result));
     operator = ClickOperator;
     result ='';

    }
    setState(() {
      result ='';
    });
   }


   String Calculate(double lhs,String operator, double result){

     if(operator == '+'){
       return (lhs+result).toString();
     }
     else if(operator == '-'){
       return (lhs-result).toString();
     }
     else if(operator == '*'){
       return (lhs*result).toString();
     }
     else{
       return (lhs/result).toString();
     }

   }

   void EqualClicked(){
     setState(() {
       result = Calculate(double.parse(lhs),operator,double.parse(result));
       lhs='';
       operator='';
     });
   }


}
