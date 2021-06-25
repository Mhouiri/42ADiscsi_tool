import 'package:flutter/material.dart';
import 'package:flutter_auth/UI/loadingPage.dart';
import 'package:flutter_auth/features/authentication/model/authenticationModel.dart';
import 'package:flutter_auth/model/UserProfil.dart';
import 'package:flutter_auth/UI/confirmPage.dart';
import 'package:flutter_auth/network/network.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  UserProfileModal userData;
  Authenticate logIn;
  String uid = "";
  bool loading = false;

  Future<void> authentication() async{
    try{
      setState(() => loading = true);
      logIn = Authenticate();
      await logIn.authorizeUser();
      await logIn.getAccessToken();
      userData = await Network().getUserData(logIn.accessToken);
      await Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage(login: userData.firstName,),),);
      setState(() => loading = false);
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
     return LoadingPage();
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
                  Text("When to use this?", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text("For the sake of not causing issues to your own session, do not use this unless you cannot login due to an ISCSI target issue.", ),
                  SizedBox(height: 10),
                  Divider(thickness: 0.8, color: Colors.black12),
                  FlatButton(
                    shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                  style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(50)),
                    color: Colors.blueGrey[900],
                  onPressed: () async {
                  await authentication();
                  },
                  child: Text("Fix ISCSI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
                ),
                ),
                ],
                )
                )
            ]
            ),
        ),
      );
  }
}
