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
    this.y += getCount * 5;
    println(getCount);
  }
  
  void draw(){
    //下線を表示
    stroke(colorBlack);
    strokeWeight(2);
    line(this.x, this.y, this.x+this.w, this.y);  //区切り線
    
    //日付を表示
    textSize(20);
    textFont(open_sans_regular);
    textAlign(CENTER, BOTTOM);
    fill(colorBlack);
    text(this.dateTime.get(Calendar.DATE), this.x + 30, this.y);
  }
}


class TaskPanel extends Panel{
  String taskTitle;
  String taskType = "あ";
  
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
      Calendar nyanday = Calendar.getInstance();
      println("planDate DATE",planDate.get(i).get(Calendar.DATE));
      if(isSameDate(this.dateTime, planDate.get(i))){//このパネルが持つ日時と予定日時が同じなら、
        taskType = "予定";
      }else if(isSameDate(this.dateTime, deadlineDate.get(i))){//このパネルが持つ日時と締切日時が同じなら、
        taskType = "締切";
        println(taskType);
      }else if(isSameDate(this.dateTime, predictDate.get(i))){//このパネルが持つ日時と推測日時が同じなら、
        taskType = "推測";
        println(taskType);
      }
    }
  }
  
  void draw(){
   super.draw();
   rect(width - 100, this.y, 60, 30);  //種別の背景になる四角形を表示
   
   textFont(mgenplus_heavy);
   textAlign(RIGHT, CENTER);
   fill(255, 0, 0);//fill(colorWhite);
   text(taskType, width - 140, this.y);  //種別を表示
   //println(taskType);
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
