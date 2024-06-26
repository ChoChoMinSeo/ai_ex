import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_ex/firebaseGetUser.dart';
import 'package:ai_ex/page/pickType.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> userData= ['키', '몸무게', '나이', '성별'];
  List<String> genderList = ['남성', '여성'];
  String gender = '남성';
  bool loaded = false;
  Future<String> getUser() async{
    final url = Uri.parse('http://artist22.pythonanywhere.com/login');
    http.Response res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'email': userEmail
          }
        ));
    final data = jsonDecode(res.body);
    setState(() {
      dataList = [data['height'],data['weight'],data['age'],data['gender']];
      loaded = true;
    });
    return res.body;
  }
  Future<String> updateData() async{
    final url = Uri.parse('http://artist22.pythonanywhere.com/update');
    http.Response res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {
              'email': userEmail,
              'data': dataList
            }
        ));
   print(res.body);
    return 'o';
  }
  @override
  void initState() {
    gender = dataList[3];
    getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x00f7c8e0).withOpacity(1),
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height/8,
              decoration: BoxDecoration(
                color: const Color(0x00B4E4FF).withOpacity(1)
              ),
              child: const Center(
                child: Text('AI에게\n당신의 정보를 알려주세요!', style: TextStyle(
                  fontSize: 30
                ),),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width/15),
                child: GridView.builder(
                  itemCount: 4,
                    shrinkWrap: false,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3/2
                    ),
                    itemBuilder: (context, int index){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(userData[index],style: const TextStyle(fontSize: 20),),
                          GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width/2,
                                      height: MediaQuery.of(context).size.height/10,
                                      child: AlertDialog(
                                        actions: [
                                          if(index!=3)
                                          TextField(
                                            onChanged: (v){
                                              setState(() {
                                                dataList[index] = int.parse(v);
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              hintText: '숫자만 입력',
                                              focusColor: Colors.black
                                            ),
                                          ),
                                          if(index==3)
                                          Center(
                                            child: DropdownButton(
                                              value: gender,
                                                items: genderList.map((String item) {
                                                  return DropdownMenuItem(
                                                    value: item,
                                                    child: Text(item),
                                                  );
                                                }).toList(),
                                                onChanged: (v){
                                                  setState(() {
                                                    gender = v.toString();
                                                    dataList[3] = gender;
                                                  });
                                                }
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/10,
                              width: MediaQuery.of(context).size.width/3,
                              decoration: BoxDecoration(
                                color: const Color(0x0095BDFF).withOpacity(1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('${dataList[index]}',style: const TextStyle(fontSize: 20),),),
                            ),
                          )
                        ],
                      );
                    }
                ),
              ),
            ),
            if(!loaded)
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.width/2,
              child: const CircularProgressIndicator(
                strokeWidth: 30,
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: ()async{
                  await updateData();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PickPage()));
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x00DFFFD8).withOpacity(1),
                elevation: 0
              ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('다음단계',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,)
          ],
        ),
      ),
    );
  }
}