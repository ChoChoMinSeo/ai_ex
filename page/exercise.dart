import 'dart:async';

import 'package:ai_ex/page/result.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final List senteces; final List sets; final List persets;
  const ExercisePage({Key? key, required this.senteces, required this.sets, required this.persets}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int curSet = 1;
  int stage = 0;
  int seconds=0;
  int minutes=0;
  Timer timer =  Timer.periodic(const Duration(seconds: 1),(timer){});
  bool isRunning = false;
  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }
  @override
  void initState() {
    widget.senteces.add('마지막 운동입니다. 파이팅!');
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.width/6,
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
                            const SizedBox(height: 2,),
                            const Expanded(child: FittedBox(child: Text('세트당 2분 쉬는시간!'))),
                            Expanded(
                                child: FittedBox(child:
                                Text('${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}'))
                            ),
                            const SizedBox(height: 2,),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0x0000235b).withOpacity(1),
                        elevation: 0
                      ),
                        onPressed: (){
                          timer.cancel();
                          isRunning= false;
                        },
                        child: const Text('그만 쉬기',style: TextStyle(color: Colors.white),)
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
                      stage!=widget.senteces.length-1?
                      Text(widget.senteces[stage],style: const TextStyle(fontSize: 25),):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('모든 운동을 끝냈습니다!',style: TextStyle(fontSize: 25),),
                          SizedBox(height: 10,),
                          Text('아래의 운동 끝내기 버튼을 눌러주세요.',style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      if(stage!=widget.senteces.length-1)
                      Text('현재: $curSet세트 진행중',style: const TextStyle(fontSize: 20),),
                      const Spacer(),
                      if(stage!=widget.senteces.length-1)
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height/15,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0x003F497F).withOpacity(1),
                                  elevation: 0
                              ),
                              onPressed: (){
                                isRunning = true;
                                timer.cancel();
                                setState(() {
                                  minutes=0;
                                  seconds=0;
                                });
                                timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                                  setState(() {
                                    seconds++;
                                    if(seconds==60){
                                      seconds=0;
                                      minutes++;
                                    }
                                  });
                                });
                                setState(() {
                                  curSet+=1;
                                  if(curSet == widget.sets[stage]+1){
                                    curSet = 1;
                                    stage+=1;
                                  }
                                });
                              },
                              child: const Text('세트완료',style: TextStyle(color: Colors.white,fontSize: 20),)
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/20,),
                    ],
                  ),
              ),
            ),
                )),
            const Icon(Icons.keyboard_double_arrow_down,size: 50,),
            stage!= widget.senteces.length-1 ?
            Expanded(
              flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(widget.senteces[stage+1],
                        style: const TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                )
            ):const Expanded(child: SizedBox()),
            SizedBox(height: MediaQuery.of(context).size.height/15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x003f497f).withOpacity(1),
                elevation: 0
              ),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ResultPage()));
                },
                child: const Text('운동 끝내기!', style: TextStyle(color: Colors.white),)
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
        ],),
      ),
    );
  }
}
