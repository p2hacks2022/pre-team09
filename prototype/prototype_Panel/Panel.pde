abstract class UI {
 float x, y, w, h; 
 UI(float _x, float _y, float _w, float _h){
   //インスタンス：座標大きさ(x,y,w,h)
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
 }
}

class Panel extends UI{//もしかするとextends Taskになる可能性あり？
  Calendar  dateTime;
  
  Panel(float _x, float _y, float _w, float _h, Calendar _dateTime){
    super(_x, _y, _w, _h);
    this.dateTime = _dateTime;
  }
  Panel(float _y, float _h, int _width, float _screen_ratio,  Calendar _dateTime){
    //インスタンス：座標(y), 高さ<(h)>, 幅<画面幅(width), パネルの画面幅比(scree_ratio)>,  年月日日(dateTime)
    super(width*(1 - _screen_ratio)/2, _y, width*_screen_ratio, _h);
    this.dateTime = _dateTime;
  }
  
  int getCount;
  
  void mouseWheel(MouseEvent event){
    getCount = event.getCount();
    this.y += getCount * 5;//スクロールの動きを滑らかにする
    println(getCount);
  }
  
  void draw(){
    //下線を表示
    stroke(colorBlack);
    strokeWeight(2);
    //line(this.x, this.y, this.x+this.w, this.y);  //区切り線
    noFill();
    rect(this.x, this.y, this.w, this.h);
    textBox(str(this.dateTime.get(Calendar.DATE)), colorBlack, 20, this.x, this.y, this.w, this.h);
  }
}


class TaskPanel extends Panel{
  String taskTitle;
  String taskType = "なし";
  String taskTime_str;
  
  TaskPanel(float _x, float _y, float _w, float _h, Calendar _dateTime){
    super(_x, _y, _w, _h, _dateTime);
  }
  TaskPanel(float _y, float _h, int _width, float _screen_ratio,  Calendar _dateTime){
    super(_y, _h, _width, _screen_ratio, _dateTime); 
  }
  
  //タスク情報を取得するメソッド：タスクタイトル、予定日時データ、締切日時データ、推測日時データ
  void getTaskDate(String _taskTitle, ArrayList<Calendar>  planDate, ArrayList<Calendar> deadlineDate, ArrayList<Calendar> predictDate){
    this.taskTitle = _taskTitle;
    println(taskTitle);
    for(int i = 0; i < planDate.size(); i++){
      Calendar day = Calendar.getInstance();
      println("planDate DATE aaaaa",planDate.get(i).get(Calendar.DATE));
      if(isSameDate(this.dateTime, planDate.get(i))){//このパネルが持つ日時と予定日時が同じなら、
        taskType = "予定";
        taskTime_str = calendarToString_HourMinute(planDate.get(i));
      }else if(isSameDate(this.dateTime, deadlineDate.get(i))){//このパネルが持つ日時と締切日時が同じなら、
        taskType = "締切";
        taskTime_str = calendarToString_HourMinute(deadlineDate.get(i));
      }else if(isSameDate(this.dateTime, predictDate.get(i))){//このパネルが持つ日時と推測日時が同じなら、
        taskType = "推測";
        taskTime_str = calendarToString_HourMinute(predictDate.get(i));
      }
    }
  }
  
  void draw(){
   super.draw();//Panelクラスから継承
   //タスクタイトル表示
   
   textFont(mgenplus_heavy);
   textBox(taskTitle, colorBlack, 20, this.x, this.y, 30, 50);
   
   //ラベル表示（予定か締切か推測か）
   float x_label = width - 170, y_label = this.y - 40, w_label = 60, h_label = 30;
   println("inClass;",this.y);
   rect(x_label, this.y, w_label, this.h);  //種別の背景になる四角形を表示
   textFont(mgenplus_heavy);
   textBox(taskType, colorWhite,20, x_label, this.y, w_label, this.h);  //種別を表示
   println("inClass;",this.y);
   //時間表示
   textFont(mgenplus_regular);
   textBox(taskTime_str, colorBlack, 20,x_label + 70,this.y, w_label, this.h);
  }
}



 
  
//年月日が同じかどうか判定する関数
boolean isSameDate(Calendar timeA, Calendar timeB){
  boolean isSame = false;
  println("timeA DATE", timeA.get(Calendar.DATE));
  println("timeB DATE", timeB.get(Calendar.DATE));
  if(timeA.get(Calendar.YEAR) == timeB.get(Calendar.YEAR) &&//年が同じか 
  timeA.get(Calendar.MONTH)+1 == timeB.get(Calendar.MONTH)+1 && //月が同じか
  timeA.get(Calendar.DATE) == timeB.get(Calendar.DATE))//日が同じか
  {
    isSame = true;
  }
  println(isSame);
  return isSame;
}

void setHourAndMinute(Calendar timeA, Calendar timeB){
  timeA.set(Calendar.HOUR_OF_DAY, timeB.get(Calendar.HOUR_OF_DAY));
  timeA.set(Calendar.MINUTE, timeB.get(Calendar.MINUTE));
}

String calendarToString_HourMinute(Calendar time){
  String time_string = "";
  time_string = str(time.get(Calendar.HOUR_OF_DAY)) + ":" + str(time.get(Calendar.MINUTE));
  return time_string;
}
