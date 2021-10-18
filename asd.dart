import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/screen/login.dart';
import 'package:dhbt_okulu/screen/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              color: Colors.red,
              width: 420,
            ),
            Text("Hedefine ulaşmak ister misin?",style: TextStyle(fontSize: 25,color: FixedColor().color2),),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,),
                child: ElevatedButton(onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const Register()));
                 },
                child: const Text("Kayıt Ol", style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  primary: FixedColor().color3,
                  fixedSize: Size(MediaQuery.of(context).size.width*0.9, MediaQuery.of(context).size.height*0.055),
                ),),
              ),
            ),
            Center(
              child: OutlinedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const Login()));
              }, child: Text("Giriş Yap", style: TextStyle(color: FixedColor().color3, fontSize: 17),),
                style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                         color: FixedColor().color3, 
                         width: 1
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width*0.9, MediaQuery.of(context).size.height*0.055)
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
