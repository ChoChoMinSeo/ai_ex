import 'dart:convert';
import 'dart:typed_data';
import 'package:ai_ex/firebaseGetUser.dart';
import 'package:http/http.dart' as http;

Future<dynamic> chatGPT(int type)async{
  String exer = '전신';
  if(type == 1){
    exer = '상체';
  }
  else if(type==2){
    exer = '하체';
  }
  final input = {
  'model':'gpt-3.5-turbo',
  'messages': [
    {
    'role': 'user',
  'content': '키 ${dataList[0]}에 몸무게 ${dataList[1]}에 ${dataList[2]}살 ${dataList[3]} 오늘 1시간 동안 할 $exer 홈트레이닝 루틴을 한글로 추천해줘. 운동 이름 앞뒤에는 <>표시를 넣어줘. 예를 들어서 형식을 정해줄께. 1. <스쿼트> 3세트 15회 2. <팔굽혀펴기> 3세트 10회. 이런식으로 추천해 줘'
  }
  ],
    "stream": false
  };
  final url = Uri.parse('https://norchestra.maum.ai/harmonize/dosmart');
  http.Response res = await http.post(url,
      headers: {
        "content-type": "application/json; charset=utf-8",
        "Accept": 'application/json'
      },
      body: jsonEncode(
        {
        "app_id":"9c780723-ed1f-5bf9-a585-76cb19546f54",
        "name":"Ai Speaking",
          "item":[
            "chatgpt-35-turbo-rest"
          ],
          "param":[
            input
            ]
        }
      )
  );
  final result = jsonDecode(res.body);
  print(result);
  return result;
}
// Future<dynamic> speaking(String answer)async{
//   final input = {
//     'model':'gpt-3.5-turbo',
//     'messages': [
//       {
//         'role': 'user',
//         'content': '$answer 이 루틴을 순서대로 자연스럽게 말하는 것처럼 해줘'
//       }
//     ],
//     "stream": false
//   };
//   final url = Uri.parse('https://norchestra.maum.ai/harmonize/dosmart');
//   http.Response res = await http.post(url,
//       headers: {
//         "content-type": "application/json; charset=utf-8",
//         "Accept": 'application/json'
//       },
//       body: jsonEncode(
//           {
//             "app_id":"54a4af8c-5786-5ffc-b89b-902f3b592eaa",
//             "name":"Ai Exercise",
//             "item":[
//               "chatgpt-35-turbo-rest"
//             ],
//             "param":[
//               input
//             ]
//           }
//       )
//   );
//   print(jsonDecode(res.body));
//   Uint8List sound = res.bodyBytes;
//   print(res.bodyBytes);
//   final result = jsonDecode(res.body);
//   return result;
// }
final Map<String, Object> temp = {
  'answer': '1. <푸시업> 3세트 12회 2. <랫 풀 다운> 3세트 12회 3. <딥스> 3세트 10회4. <덤벨 벤치 프레스> 3세트 12회 5. <바벨 로우> 3세트 12회 6. <플랭크> 3세트 1분 유지 7. <바이셉스 컬> 3세트 12회 8. <트라이셉스 익스텐션> 3세트 12회',
  'exercises': ['푸시업', '랫 풀 다운', '딥스', '덤벨 벤치 프레스', '바벨 로우', '플랭크', '바이셉스 컬', '트라이셉스 익스텐션'],
  'links': ['kz84Fc6HGu4', '', '','' , '', '','' , ''],
  'persets': [12, 12, 10, 12, 12, -1, 12, 12],
  'sentences': ['1. <푸시업> 3세트 12회',
 '2. <랫 풀 다운> 3세트 12회'
 , '3. <딥스> 3세트 10회'
, '4. <덤벨 벤치 프레스> 3세트 12회'
, '5. <바벨 로우> 3세트 12회'
 , '6. <플랭크> 3세트 1분 유지'
 , '7. <바이셉스 컬> 3세트 12회'
 , '8. <트라이셉스 익스텐션> 3세트 12회'], 'sets': [3, 3, 3, 3, 3, 3, 3, 3]};