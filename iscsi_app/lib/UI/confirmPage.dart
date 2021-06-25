import 'package:flutter/material.dart';
import 'package:flutter_auth/UI/loadingPage.dart';
import 'package:flutter_auth/UI/networkError.dart';
import 'package:http/http.dart' as http;

class ConfirmPage extends StatefulWidget {
  final String login;

  const ConfirmPage({Key key, this.login}) : super(key: key);
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

enum Status {  Loading, Success, Error }

class _ConfirmPageState extends State<ConfirmPage> {

  Status status = Status.Loading;


  @override
  void initState() {
    super.initState();
      http.get('http://10.51.1.1:3000/reset/').then((res) {
        setState(() {
          status = Status.Success;
        });
      }).timeout(Duration(seconds: 3),
      onTimeout: () {
        setState(() {
          status = Status.Error;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    if (status == Status.Loading)
      return LoadingPage();
    if (status == Status.Error)
      return NetworkError();
    return Scaffold(
      backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey[900],
                child: Image.asset('assets/logo.png', height: 80, width: 80,),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(children: <Widget>[
                  SizedBox(height: 10),
                  Text("ISCSI target issue fixed successfully", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 10),
                  Image.asset("assets/check.png", height: 45, width: 45,),
                ],
                )
                )
            ]
            ),
        ),
      );
  }
}