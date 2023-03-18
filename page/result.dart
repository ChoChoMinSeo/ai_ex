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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(),
                  ElevatedButton(onPressed: (){}, child: Text('SNS에 공유하기')),
                  ElevatedButton(onPressed: (){}, child: Text('개발자에게 피드백')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Text('한번더?')),
                ElevatedButton(
                    onPressed: (){
                      SystemNavigator.pop();
                    },
                    child: Text('나가기')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
