import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(MaterialApp(home:app1()));
}

class app1 extends StatefulWidget{
  @override
  _app1State createState() => _app1State();
}

class _app1State extends State<app1> {
  int d = 0;
  int m = 0;
  int y = 0;
  String days1="", month1="", year1="";

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text("Lab 2") ,),
    body: Center(
      child: Column(children: <Widget>[
        ElevatedButton(child: Text("Alege data"), onPressed: (){f1();},),
        Text(year1 + " " + month1 + " " + days1, style: TextStyle(fontSize: 28),)
      ],),
    )



    );
  }

  Future f1() async
  {
    DateTime? date1 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());

    setState(() {
      d = int.parse(DateFormat("dd").format(date1 as DateTime));
      m = int.parse(DateFormat("MM").format(date1 as DateTime));
      y = int.parse(DateFormat("yy").format(date1 as DateTime));

      int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
      int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yy").format(DateTime.now()));

      if(d1-d>=0)
        days1 = (d1-d).toString() + " days";
      else {
        days1 = (d1 +30 - d).toString() + " days";
        m1 = m1 - 1;
      }

      if (m1 - m >= 0){
        month1 = (m1 - m).toString() + " months";
      }
      else{
        month1 = (m1 + 12 - m).toString() + " months";
        y1 = y1 - 1;
      }

      year1 = (y1 - y).toString() + " years";



    });


  }
}