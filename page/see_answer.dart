import 'package:ai_ex/maum.dart';
import 'package:ai_ex/page/exercise.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnswerPage extends StatefulWidget {
  final int exerciseType;
  const AnswerPage({Key? key, required this.exerciseType}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  bool edit = false;
  String answer='';
  bool loading = true;
  List sentences=['ChatGPT가 운동 루틴을 고민하고 있습니다...'];
  List links=[];
  List sets=[];
  List exercises = [];
  List perSets=[];
  List tempSentences=[];
  int sentenceCount=1;
  int curNum=0;
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'kz84Fc6HGu4',
    flags: YoutubePlayerFlags(
      mute: false,
      autoPlay: false,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    )
  );
  void removeExercise(int index){
    tempSentences.removeAt(index);
    exercises.removeAt(index);
    links.removeAt(index);
    sets.removeAt(index);
    perSets.removeAt(index);
  }
  void buildSentences(){
    sentences=[];
    setState(() {
      for(int i=0;i<exercises.length;i++){
        String sentence='';
        if(perSets[i]!=-1){
          sentence = '${i+1}. ${exercises[i]} ${sets[i]}세트 ${perSets[i]}회';
        }else{
          sentence = tempSentences[i];
        }
        sentences.add(sentence);
      }
      sentenceCount = sentences.length;
      loading = false;
    });
  }
  Future<int> getAnswer() async{
    setState(() {
      sentences=['ChatGPT가 운동 루틴을 고민하고 있습니다...'];
      sentenceCount=1;
      links= [''];
    });
    // final answer = await chatGPT(widget.exerciseType);
    final Map answer = temp;
    // String totAnswer = answer['answer'];
    // await speaking(totAnswer);
    setState(() {
      exercises = answer["exercises"];
      links = answer["links"];
      sets=answer["sets"];
      perSets = answer["persets"];
      tempSentences = answer["sentences"];
    });
    buildSentences();
    return 0;
  }
  @override
  void initState() {
    // TODO: implement initState
    getAnswer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10),
              ProgressBar(isExpanded: true,
                colors: ProgressBarColors(backgroundColor: Colors.grey,playedColor: Colors.redAccent,handleColor: Colors.red),),
              FullScreenButton(color: Colors.white,),
            ],
            controller: _controller,
          ),
          builder: (context, player){
            return Column(
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
                        child: const Center(child: Text("ChatGPT와의 대화",style: TextStyle(fontSize: 30),))
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
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
                                    child: ListView.builder(
                                      itemCount: sentenceCount,
                                      itemBuilder: (context, index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container( //나중에 Listview로
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(30),
                                                    bottomLeft: Radius.circular(30),
                                                    bottomRight: Radius.circular(30)
                                                )
                                              ),
                                              child: GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    edit = !edit;
                                                    curNum = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(sentences[index]),
                                                      if(links[index]!='')
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(height: 10,),
                                                            YoutubePlayer(
                                                              controller: _controller,
                                                                key: ObjectKey(_controller),
                                                              bottomActions: [
                                                                CurrentPosition(),
                                                                const SizedBox(width: 10),
                                                                ProgressBar(isExpanded: true,
                                                                  colors: ProgressBarColors(backgroundColor: Colors.grey,playedColor: Colors.redAccent,handleColor: Colors.red),),
                                                                FullScreenButton(color: Colors.white,),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 20,)
                                                          ],
                                                        ),
                                                      if(loading)
                                                      Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                                                          child: SizedBox(
                                                            height:MediaQuery.of(context).size.height/6,
                                                            width:MediaQuery.of(context).size.height/6,
                                                            child: CircularProgressIndicator(
                                                              color: const Color(0x00be6db7).withOpacity(1),
                                                              strokeWidth: 50,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                      ),
                                            const SizedBox(height: 20,)
                                          ],
                                        );}
                                    ),
                                  )
                              )
                            ],
                    ),
                        ))
                    //말풍선 위치
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0x0095bdff).withOpacity(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(edit)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sentences[curNum],style: const TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                        const SizedBox(height: 10,),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            height: MediaQuery.of(context).size.height/12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x00BBD6B8).withOpacity(1),
                                elevation: 0
                              ),
                                onPressed: ()async{
                                await showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        content: const Text('정말로 뺄까요?'),
                                        actions: [
                                          OutlinedButton(
                                              onPressed: (){
                                                removeExercise(curNum);
                                                buildSentences();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('예',style: TextStyle(color: Colors.black),)
                                          ),
                                          OutlinedButton(
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('아니오',style: TextStyle(color: Colors.black),)
                                          ),
                                        ],
                                      );
                                    }
                                );
                                setState(() {
                                  edit = false;
                                });
                                },
                                child: const Text('빼줘!',style: TextStyle(color: Colors.black,fontSize: 20),)),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        if(perSets[curNum]!=-1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width/5,
                              height: MediaQuery.of(context).size.height/12,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0x00BBD6B8).withOpacity(1),
                                      elevation: 0
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      sets[curNum]+=1;
                                    });
                                    buildSentences();
                                  },
                                  child: const FittedBox(child: Text('세트수\n늘려줘!',style: TextStyle(color: Colors.black,fontSize: 20),))),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/5,
                              height: MediaQuery.of(context).size.height/12,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0x00BBD6B8).withOpacity(1),
                                      elevation: 0
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      perSets[curNum]+=1;
                                    });
                                    buildSentences();
                                  },
                                  child: const FittedBox(child: Text('반복수\n늘려줘!',style: TextStyle(color: Colors.black,fontSize: 20),))),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/5,
                              height: MediaQuery.of(context).size.height/12,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0x00BBD6B8).withOpacity(1),
                                      elevation: 0
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      sets[curNum]-=1;
                                    });
                                    buildSentences();
                                  },
                                  child: const FittedBox(child: Text('세트수\n줄여줘!',style: TextStyle(color: Colors.black,fontSize: 20),))),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/5,
                              height: MediaQuery.of(context).size.height/12,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0x00BBD6B8).withOpacity(1),
                                      elevation: 0
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      perSets[curNum]-=1;
                                    });
                                    buildSentences();
                                  },
                                  child: const FittedBox(child: Text('반복수\n줄여줘!',style: TextStyle(color: Colors.black,fontSize: 20),))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0x00bbd6b8).withOpacity(1),
                                    elevation: 0
                                ),
                                onPressed: ()async{
                                  setState(() {
                                    edit = false;
                                    loading = true;
                                  });
                                  await getAnswer();
                                  buildSentences();
                                },
                                child: const Text('재 생성',style: TextStyle(color: Colors.black, fontSize: 20),)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0x00bbd6b8).withOpacity(1),
                                    elevation: 0
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExercisePage(senteces: sentences, sets: sets, persets: perSets)));
                                },
                                child: const Text('운동 시작',style: TextStyle(color: Colors.black, fontSize: 20),)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          );
          }
        ),
      ),
    );
  }
}