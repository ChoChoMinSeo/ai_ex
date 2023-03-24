import 'package:ai_ex/firebaseGetUser.dart';
import 'package:ai_ex/page/see_answer.dart';
import 'package:flutter/material.dart';

class PickPage extends StatefulWidget {
  const PickPage({Key? key}) : super(key: key);

  @override
  State<PickPage> createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height/8,
              decoration: BoxDecoration(
                  color: const Color(0x00B4E4FF).withOpacity(1)
              ),
              child: Center(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$myname님,\n오늘은 어떤 운동을 하시나요?',
                      style: const TextStyle(
                        fontSize: 30
                    ),),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            circleButton(
                    () {
                      Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnswerPage(exerciseType: 1,)));
                },
                const Color(0x00dc8449).withOpacity(1),
                '오늘은 상체', context),
            const SizedBox(height: 20,),
            circleButton(
                    () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnswerPage(exerciseType: 2,)));
                    },
                const Color(0x00fdd36a).withOpacity(1),
                '질수없다 하체', context),
            const SizedBox(height: 20,),
            circleButton(
                    () {
                      Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnswerPage(exerciseType: 3,)));
                },
                const Color(0x00be6db7).withOpacity(1),
                '여유롭게 전신', context),
          ],
        ),
      ),
    );
  }
}
Widget circleButton(VoidCallback pressed, Color buttoncolor, String inside, BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height/5,
    child: ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor,
        shape: const CircleBorder(),
        elevation: 0,
      ),
      child: Text(inside,style: const TextStyle(color: Colors.black,fontSize: 20),),
    ),
  );
}