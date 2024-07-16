import 'package:flutter/material.dart';
import 'package:lms_apps/Models/mysql.dart';
import 'package:mysql1/mysql1.dart';

class CobaScreen extends StatefulWidget {
  const CobaScreen({super.key});

  @override
  State<CobaScreen> createState() => _CobaScreenState();
}

class _CobaScreenState extends State<CobaScreen> {
  var db = new Mysql();
  var guestname = '';

  void _getnama (){
    setState(() {
      db.getConnection().then((conn){
        String Sql = 'Select username from mdl_user where id = 2;';
        conn.query(Sql).then((result){
          for(var row in result){
            setState(() {
              guestname = row[0];
            });
          }
        });
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('guest name'),
          Text('$guestname')
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _getnama, tooltip: 'Incretmen', child: Icon(Icons.add),),
    );
  }
}