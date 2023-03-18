import 'package:ai_ex/page/result.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int curSet = 1;
  int stage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.width/7,
            decoration: BoxDecoration(
                color: const Color(0x00B4E4FF).withOpacity(1)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer,size: MediaQuery.of(context).size.width/8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2,),
                          Expanded(child: FittedBox(child: Text('세트당 2분 쉬는시간!'))),
                          Expanded(child: FittedBox(child: Text('00:01'))),
                          SizedBox(height: 2,),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x00235B).withOpacity(1),
                      elevation: 0
                    ),
                      onPressed: (){},
                      child: Text('그만 쉬기',style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Container(
                  width: double.maxFinite,
                  color: Colors.grey,
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Step 1: 어떤운동',style: TextStyle(fontSize: 25),),
                    SizedBox(height: 10,),
                    Text('목표 횟수: 10회 3세트',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Text('현재: $curSet세트 진행중',style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height/15,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0x3F497F).withOpacity(1),
                                elevation: 0
                            ),
                            onPressed: (){
                              setState(() {
                                curSet+=1;
                              });
                            },
                            child: Text('세트완료',style: TextStyle(color: Colors.white,fontSize: 20),)
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                  ],
                ),
            ),
          ),
              )),
          Icon(Icons.keyboard_double_arrow_down,size: 50,),
          Expanded(
            flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Step2: 다ㅏ음어떤거',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.center,),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height/15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0x3F497F).withOpacity(1),
              elevation: 0
            ),
              onPressed: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultPage()));
              },
              child: Text('운동 끝내기!', style: TextStyle(color: Colors.white),)
          ),
          SizedBox(height: MediaQuery.of(context).size.height/20,),
      ],),
    );
  }
}
