import 'package:ai_ex/page/exercise.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({Key? key}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height/16,
                    decoration: BoxDecoration(
                        color: const Color(0x00B4E4FF).withOpacity(1)
                    ),
                    child: Center(child: Text("ChatGPT와의 대화",style: TextStyle(fontSize: 30),))
                ),
                Spacer(),
                //말풍선 위치
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0x95BDFF).withOpacity(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1번 어떤 운동 설정',style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                  SizedBox(height: 10,),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height/12,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xBBD6B8).withOpacity(1),
                          elevation: 0
                        ),
                          onPressed: (){},
                          child: Text('빼줘!',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/12,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xBBD6B8).withOpacity(1),
                                elevation: 0
                            ),
                            onPressed: (){},
                            child: Text('늘려줘!',style: TextStyle(color: Colors.black,fontSize: 20),)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/12,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xBBD6B8).withOpacity(1),
                                elevation: 0
                            ),
                            onPressed: (){},
                            child: Text('줄여줘!',style: TextStyle(color: Colors.black,fontSize: 20),)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/16,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xBBD6B8).withOpacity(1),
                              elevation: 0
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExercisePage()));
                          },
                          child: Text('운동 시작',style: TextStyle(color: Colors.black, fontSize: 20),)),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
