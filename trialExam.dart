//musa
import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/screen/exam_answer_key.dart';
import 'package:dhbt_okulu/widgets/exam_result_container.dart';
import 'package:flutter/material.dart';

class TrialExamPass extends StatelessWidget {
  const TrialExamPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Merhaba",
              style: TextStyle(color: FixedColor().color2),
            ),
            Text("Musa KIRKKESELİ",
                style: TextStyle(color: FixedColor().color3))
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 40,
              color: FixedColor().color2,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: FixedColor().color1,
        shadowColor: FixedColor().color1,
        iconTheme: IconThemeData(
          color: FixedColor().color3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Container(
              child: const Center(
                  child: Text(
                "SINAV SONUÇ KARNESİ",
                style: TextStyle(fontSize: 20),
              )),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: FixedColor().color2,
              ),
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const ExamAnswerKey() ));
              },
              child: ListTile(
                title: Text(
                  "CEVAP ANAHTARINI GÖRÜNTÜLE",
                  style: TextStyle(color: FixedColor().color1, fontSize: 14),
                ),
                leading: Icon(
                  Icons.assignment_turned_in_outlined,
                  color: FixedColor().color1,
                  size: 40,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.08),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            ExamResultContainer(
              text: "DHBT 1 TESTİ SONUÇLARI",
            ),
          ],
        ),
      ),
    );
  }
}
