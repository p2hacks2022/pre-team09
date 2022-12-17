float screen_ratio = 0.9;

//カレンダーパネルのクラス
class Panel extends Button {
  Calendar  dateTime;//カレンダー上の日付
  
  Panel(float _x, float _y, float _w, float _h, Calendar _dateTime){
    super(_x, _y, _w, _h, colorWhite);//UIクラスから継承
    target = _y;
    this.dateTime = _dateTime;
  }
  Panel(float _y, float _h, int _width, float _screen_ratio,  Calendar _dateTime){
    //インスタンス：座標(y), 高さ<(h)>, 幅<画面幅(width), パネルの画面幅比(scree_ratio)>,  年月日日(dateTime)
    super(_width*(1 - _screen_ratio)/2, _y, _width*_screen_ratio, _h, colorWhite);//UIクラスから継承
    target = _y;
    this.dateTime = _dateTime;
  }
  
  int getCount, count=30;
  float target;
  
  void mouseWheel(MouseEvent event){
    getCount = event.getCount();
    target= this.y + getCount * 100;//スクロールの動きを滑らかにする
    //println(getCount);
  }
  
  void draw(){
    if(this.y < target){
      this.y += abs(target-this.y)/10;
    }else if(this.y > target){
      this.y -= abs(target-this.y)/10;
    }
    //println(target);
    
    //下線を表示
    stroke(colorBlack);
    strokeWeight(1);
    noStroke();
    //line(this.x, this.y, this.x+this.w, this.y);  //区切り線
    
    fill(100,100);
    rect(this.x+2, this.y+2, this.w, this.h);
    fill(255);
    rect(this.x, this.y, this.w, this.h);
    textAlign(CENTER, CENTER);
    textBox(str(this.dateTime.get(Calendar.DATE)), colorBlack, 30, this.x, this.y, 50, this.h);
  }
}


class TaskPanel extends Panel{
  String taskTitle;
  String taskType = "なし";
  String taskTime_str;
  color labelColor;
  int taskIndex;//日付と対応するデータのインデックス
  
  TaskPanel(float _x, float _y, float _w, float _h, Calendar _dateTime){
    super(_x, _y, _w, _h, _dateTime);
    taskTitle = "";
  }
  TaskPanel(float _y, float _h, int _width, float _screen_ratio,  Calendar _dateTime){
    super(_y, _h, _width, _screen_ratio, _dateTime);
    taskTitle = "";
  }
  
  //日付が一致する日時データがあるか取得するメソッド：タスクタイトル、予定日時データ、締切日時データ、推測日時データ
  void getTaskDate(ArrayList<String> taskTitleArray, ArrayList<Calendar>  planDateArray, ArrayList<Calendar> deadlineDateArray, ArrayList<Calendar> predictDateArray, ArrayList<Integer> isDone){
    
    for(int i = 0; i < taskTitleArray.size(); i++){
      if(isDone.get(i) == 0){//もし完了していなかったら
        //println("planDate DATE",planDateArray.get(i).get(Calendar.DATE));
        if(isSameDate(this.dateTime, planDateArray.get(i))){//このパネルが持つ日時と予定日時が同じなら、
          this.taskType = "予定";
          this.labelColor = colorBlack;
          taskIndex = i;
          this.taskTime_str = calendarToString_HourMinute(planDateArray.get(i));
          this.taskTitle = taskTitleArray.get(i);
        }else if(isSameDate(this.dateTime, deadlineDateArray.get(i))){//このパネルが持つ日時と締切日時が同じなら、
          this.taskType = "締切";
          this.labelColor = colorAttention;
          taskIndex = i;
          this.taskTime_str = calendarToString_HourMinute(deadlineDateArray.get(i));
          this.taskTitle = taskTitleArray.get(i);
        }else if(isSameDate(this.dateTime, predictDateArray.get(i))){//このパネルが持つ日時と推測日時が同じなら、
          this.taskType = "推測";
          this.labelColor = colorMain;
          this.taskTime_str = calendarToString_HourMinute(predictDateArray.get(i));
          taskIndex = i;
          this.taskTitle = taskTitleArray.get(i);
        }else if(isDone.get(i) == 1){
          println("完了",this.taskTitle);
        }
      }
    }
    //println(this.taskTitle);
  }
  
  void draw(){
   super.mouseOverStroke("box", colorSub, 12);//Buttonクラスから継承
   super.draw();//Panelクラスから継承
   
   //日付が一致するタスクがあったときの表示
   if(taskType != "なし"){
     //タスクタイトル表示
     textFont(mgenplus_heavy);
     textAlign(LEFT, CENTER);
     textBox(this.taskTitle, colorBlack, 20, this.x+80, this.y, 30, 50);
     
     float label_ratio  = 0.7;
     float x_label = width - 170, y_label = this.y + this.h*(1-label_ratio)/2, w_label = 60, h_label = this.h*label_ratio;
     
     //ラベル表示（予定か締切か推測か）
     fill(labelColor);
     rect(x_label, y_label, w_label, h_label );  //種別の背景になる四角形を表示
     textFont(mgenplus_heavy);
     textAlign(CENTER, CENTER);
     textBox(taskType, colorWhite,20, x_label, y_label, w_label, h_label );  //種別を表示
     
     //時間表示
     textFont(mgenplus_regular);
     textAlign(CENTER, CENTER);
     textBox(taskTime_str, colorBlack, 20,x_label + 70,this.y, w_label, this.h);
   }  
  }
  
  void mousePressed(){
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h) && taskType != "なし"){
      page_num = 3;//タスクビューページに移動
    }
  }
}



 
  
//年月日が同じかどうか判定する関数
boolean isSameDate(Calendar timeA, Calendar timeB){
  boolean isSame = false;
  //println("timeA DATE", timeA.get(Calendar.DATE));
  //println("timeB DATE", timeB.get(Calendar.DATE));
  if(timeA.get(Calendar.YEAR) == timeB.get(Calendar.YEAR) &&//年が同じか 
  timeA.get(Calendar.MONTH)+1 == timeB.get(Calendar.MONTH)+1 && //月が同じか
  timeA.get(Calendar.DATE) == timeB.get(Calendar.DATE))//日が同じか
  {
    isSame = true;
  }
  //println(isSame);
  return isSame;
}

void setHourAndMinute(Calendar timeA, Calendar timeB){
  timeA.set(Calendar.HOUR_OF_DAY, timeB.get(Calendar.HOUR_OF_DAY));
  timeA.set(Calendar.MINUTE, timeB.get(Calendar.MINUTE));
}

String calendarToString_HourMinute(Calendar time){
  String time_string = "";
  time_string += str(time.get(Calendar.HOUR_OF_DAY)) + ":";
  if(time.get(Calendar.MINUTE) < 10){//分が一桁の時にゼロ埋め
    time_string += "0";
  }
  time_string += str(time.get(Calendar.MINUTE));
  return time_string;
}
