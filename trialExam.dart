//ali
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/model/trial_exam_provider.dart';
import 'package:dhbt_okulu/screen/exam_result.dart';
import 'package:dhbt_okulu/widgets/exam_ques_container.dart';
import 'package:flutter/material.dart';

class TrialExamQues extends StatefulWidget {
  final String whichTrialExam;
  const TrialExamQues({
    Key? key,
    required this.whichTrialExam,
  }) : super(key: key);

  @override
  _TrialExamQuesState createState() => _TrialExamQuesState();
}

class _TrialExamQuesState extends State<TrialExamQues> {
  bool isStart = false;
  bool finish = false;
  int milisaniye = 0;
  int saniye = 10;
  int dakika = 0;
  late Timer _timer;
  final _firestore = FirebaseFirestore.instance;
  void _start() {
    setState(() {
      isStart = !isStart;
      if (isStart) {
        const onesec = Duration(seconds: 1);
        _timer = Timer.periodic(onesec, (timer) {
          setState(() {
            if (dakika == 60) {
              dakika = dakika - 1;
              saniye = 59;
            } else {
              saniye = saniye - 1;
              if ((saniye == 0) & (dakika == 0)) {
                _timer.cancel();
              } else if ((saniye == 0) & (dakika != 0)) {
                dakika = dakika - 1;
                saniye = 59;
              }
            }

            if (dakika == 0 && saniye == 0) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ExamResult()));
              print("--------------->>>sınav süresi bittiği anda veriler:${choiceNotify.value.choiceMap}");              
              choiceNotify.clearChoice();
            }
          });
        });
      } else {
        
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (isStart) {
      _timer.cancel();
    }
    super.dispose();
  }

  //////-------------> sayfa yüklenince daha önceden işareyler varsa sil
  @override
        void initState() {
          super.initState();
          choiceNotify.clearChoice();
        }


  @override
  Widget build(BuildContext context) {
    CollectionReference examRef = _firestore
        .collection("deneme")
        .doc(widget.whichTrialExam)
        .collection("sorular");

        

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${(dakika ~/ 10)}${(dakika % 10)}:${(saniye ~/ 10)}${(saniye % 10)}",
          style: TextStyle(color: FixedColor().color3, fontSize: 30),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (!isStart) {
                _start();
              } else {
                _timer.cancel();
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const ExamResult()));
                        print("--------------->>>sınavı bitire tıkladığında giden veriler:${choiceNotify.value.choiceMap}");
                choiceNotify.clearChoice();
              }
            },
            child: !isStart
                ? const Text("Sınav Başlat")
                : const Text("Sınavı Bitir"),
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
        child: Stack(
          children: [
            StreamBuilder(
              stream: examRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<DocumentSnapshot> examSnapList = snapshot.data.docs;
                return Center(
                  child: Column(
                    children: [
                       Container(
                                child: Center(
                                    child: Text(
                                  widget.whichTrialExam,
                                  style: TextStyle(
                                      fontSize: widget.whichTrialExam.length < 27 ? 30 : 20,
                                      color: FixedColor().color1),
                                )),
                                color: FixedColor().color3,
                                height: MediaQuery.of(context).size.height * 0.099,
                                width: MediaQuery.of(context).size.width,
                              ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: MediaQuery.of(context).size.height*0.889,
                        child: ListView.builder(
                          ////////--------------------------------------------------------------->>>>>>>>>>>>>>>>>>>> soru sayısı 4 değil examSnapList.length olcak
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                  ExamQuesContainer(
                                    quesnum: index+1,
                                    quesinform:
                                        examSnapList[index]['soruOnBilgi'].toString(),
                                    ques:
                                        examSnapList[index]['soruIfade'].toString(),
                                    choicetext1: examSnapList[index]['a'].toString(),
                                    choicetext2: examSnapList[index]['b'].toString(),
                                    choicetext3: examSnapList[index]['c'].toString(),
                                    choicetext4: examSnapList[index]['d'].toString(),
                                    choicetext5: examSnapList[index]['e'].toString(),
                                    choicetext6: "Seçimi Boş Bırakmak İstiyorum",
                                  ),                                    
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
