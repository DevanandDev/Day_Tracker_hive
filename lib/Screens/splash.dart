
import 'package:day_tracker/Screens/home.dart';
import 'package:day_tracker/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   checkLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    
                      'asset/images/Adobe Express - file.ico'),
                      fit: BoxFit.fill  
                      
                      )
                      )
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text('Start...',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: Text('Your Day',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      )
        ],
      )
                      
    );
  }

 void checkLog()async{
  SharedPreferences _pref= await SharedPreferences.getInstance();

    var ifLogged = _pref.getBool('key_login');

    if(ifLogged != null)
    {
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyHome()));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyLogin()));
    }
 }
}