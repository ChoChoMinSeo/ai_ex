from flask import Flask, request, jsonify
import os

path = os.path.abspath(__file__)
path =path[:-12]
app = Flask(__name__)
@app.route('/', methods = ['GET', 'POST'])
def check():
    return 'ok'
@app.route('/login', methods = ['GET', 'POST'])
def login():
    if(request.method == 'POST'):
        folder_path = path+'user'
        params = request.get_json()
        email = params['email']
        found = False
        with open(folder_path+'/id.txt','r') as file:
            lines = file.readlines()
            print(lines)
            for line in lines:
                stline = line.strip()
                if stline == email:
                    num = lines.index(line)
                    found = True
                    break
        if found:
            with open(folder_path+'/data.txt','r')as file:
                lines = file.readlines()
                data_string = lines[num].strip()
                data_list = data_string.split(',')
                data = {
                    'height': data_list[0],
                    'weight': data_list[1],
                    'age': data_list[2],
                    'gender': data_list[3]
                }
                print(data)
                return jsonify(data)
        else:
            return 'no'
@app.route('/update', methods = ['GET', 'POST'])
def update_data():
    if(request.method == 'POST'):
        folder_path = path+'user'
        params = request.get_json()
        email = params['email']
        data_list = params['data']
        data_sentence=''
        new_text_content = ''
        for data in data_list:
            data_sentence+=str(data)
            data_sentence+=','
        data_sentence.strip()
        with open(folder_path+'/id.txt','r') as file:
            lines = file.readlines()
            print(lines)
            for line in lines:
                stline = line.strip()
                if stline == email:
                    num = lines.index(line)
                    break
        with open(folder_path+'/data.txt','r')as file:
            for i, l in enumerate(lines):
                if i == num:
                    new_string = data_sentence
                else:
                    new_string = l.strip()
                if new_string:
                    new_text_content += new_string + '\n'
                else:
                    new_text_content += '\n'
        with open(folder_path+'/data.txt','w') as f:
            f.write(new_text_content)
    return 'done'
@app.route('/youtube', methods = ['GET', 'POST'])
def youtube():
    if(request.method == 'POST'):
        params = request.get_json()
        answer = params['answer']
        print(params)
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
        for index in range(len(index_list)-1):
            cur_sentence = answer[index_list[index]:index_list[index+1]]
            sentence_list.append(cur_sentence.strip())
            start = cur_sentence.find('<')
            last = cur_sentence.find('>')
            exercise = cur_sentence[start+1:last]
            start = cur_sentence.find('세트')
            link = find_link(exercise)
            if(link!='no'):
                link_list.append(link)
            else:
                link_list.append('')
        final_dict = {
            'answer': answer,
            'sentences': sentence_list,
            'links': link_list
        }
        return jsonify(final_dict)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port = 80)

def find_link(exercise):
    folder_path = path+'link'
    found = False
    exercise = exercise.replace(' ','')
    with open(folder_path+'/name.txt','r') as file:
            lines = file.readlines()
            for line in lines:
                stline = line.strip()
                if stline == exercise:
                    num = lines.index(line)
                    found = True
                    break
    if not found:
        return 'no'
    else:
        with open(folder_path+'/link.txt','r') as file:
            lines = file.readlines()
            return lines[num].strip()