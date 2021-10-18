//musa
import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/widgets/login_text_form_field.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? _kvkk = false;
  bool? _sms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Üye Ol",
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
          children: [
            LoginTexFormFiel(labelTextnum: 0),
            LoginTexFormFiel(labelTextnum: 1),
            LoginTexFormFiel(labelTextnum: 2),
            LoginTexFormFiel(labelTextnum: 3),
            LoginTexFormFiel(labelTextnum: 4),
            LoginTexFormFiel(labelTextnum: 5),
            CheckboxListTile(
              onChanged: (bool? value) {
                setState(() {
                  _kvkk = value;
                });
              },
              value: _kvkk,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("KVKK Metnini Okudum ve Onaylıyorum",style: TextStyle(color: FixedColor().color2),),
              activeColor: FixedColor().color3,
            ),
            CheckboxListTile(
              onChanged: (bool? value) {
                setState(() {
                  _sms = value;
                });
              },
              value: _sms,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                  "Bilgilendirme ve Kampanyalardan SMS'le haberdar olmak istiyorum.",style: TextStyle(color: FixedColor().color2),),
              activeColor: FixedColor().color3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Register()));
                },
                child: const Text("Kayıt Ol", style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: FixedColor().color3,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.055),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
