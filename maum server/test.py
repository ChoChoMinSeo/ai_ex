answer = '1. <런지> 3세트 12회 (각각 다리에 대해)'+'2. <푸쉬업> 3세트 10회'+'3. <레그프레스> 3세트 15회'+'4. <바이셉 컬> 3세트 12회'+'5. <덤벨 숄더 프레스> 3세트 12회'+'6. <힙 스러스트> 3세트 15회'+'7. <플랭크> 3세트 30초 유지'+'이 루틴은 전신 근력운동을 중심으로 구성되어 있으며, 근력과 근지구력을 동시에 향상시키는 데 효과적입니다. 각 운동의 셋트 수와 회수는 개인의 체력과 목표에 따라 조절할 수 있습니다. 또한, 충분한 휴식을 취하고 물을 충분히 마시는 것도 중요합니다. '
cur_num=1
index_list=[]
sentence_list=[]
link_list=[]
set_list=[]
try:
    while True:
        index = answer.find(str(cur_num)+'.')
        cur_num+=1
        if index == -1:
            break
        index_list.append(index)
except:
    0
index_list.append(len(answer))
print(answer)
for index in range(len(index_list)-1):
    cur_sentence = answer[index_list[index]:index_list[index+1]]
    sentence_list.append(cur_sentence.strip())
    start = cur_sentence.find('<')
    last = cur_sentence.find('>')
    exercise = cur_sentence[start+1:last]
    start = cur_sentence.find('세트')
    set_num = cur_sentence[start-1:start]
    print(index+1, exercise, set_num)