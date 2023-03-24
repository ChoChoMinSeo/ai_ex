import 'package:ai_ex/firebaseGetUser.dart';
import 'package:ai_ex/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex:1,
                            child: Image.asset('assets/image/ChatGPT_logo.svg.png')
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                            flex:6,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container( //나중에 Listview로
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)
                                      )
                                  ),
                                  width: double.maxFinite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('$myname님!\n오늘 운동을 성공적으로 완료하셨군요!\n우리 내일도 같이 하는거 맞죠?\n좋은 하루 보내세요!'
                                    ,style: TextStyle(fontSize: 20,height: 1.4),),
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/5,
                      width: MediaQuery.of(context).size.width/2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x00dc8449).withOpacity(1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        ),
                          onPressed: (){},
                          child: FittedBox(child: Text('SNS에 공유하기',style: TextStyle(fontSize: 30,color: Colors.black),))
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/5,
                      width: MediaQuery.of(context).size.width/2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x00fdd36a).withOpacity(1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          onPressed: (){},
                          child: FittedBox(child: Text('개발자에게 피드백',style: TextStyle(fontSize: 30,color: Colors.black)))
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0x00be6db7).withOpacity(1),
                      elevation: 0
                    ),
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Text('한번더?',style: TextStyle(color: Colors.black),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0x00be6db7).withOpacity(1),
                          elevation: 0
                      ),
                      onPressed: (){
                        SystemNavigator.pop();
                      },
                      child: Text('나가기',style: TextStyle(color: Colors.black),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
