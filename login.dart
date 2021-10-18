//musa

import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/screen/register.dart';
import 'package:dhbt_okulu/widgets/login_text_form_field.dart';
import 'package:dhbt_okulu/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Giriş",
          style: TextStyle(color: FixedColor().color3),
        ),
        centerTitle: true,
        backgroundColor: FixedColor().color1,
        iconTheme: IconThemeData(
          color: FixedColor().color3,
        ),
        shadowColor: FixedColor().color1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Hoşgeldiniz!",
                style: TextStyle(fontSize: 30),
              ),
            ),
            LoginTexFormFiel(labelTextnum: 2,),
            LoginTexFormFiel(labelTextnum: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Navbar()));
                  },
                  child: const Text("Giriş Yap", style: TextStyle(fontSize: 17)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    primary: FixedColor().color3,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.055),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hesabın yok mu?",
                  style: TextStyle(color: FixedColor().color2),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Register()));
                  },
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: FixedColor().color3),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
