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
<<<<<<< HEAD
    
    fill(255);
    for(int i = 0; i<14;i++){
        line(this.x, this.y + h + 15 + i*60, this.x + w, this.y + h + 15 + i*60);
        //rect(this.x,this.y,this.w,this.h);
    }
    fill(0);
    
    
    /*textボックスのクラスが必要！！*/
    //日付表示
    for(int k = 0; k<14; k++){
      textSize(40);
      text(this.dateTime.getDate() + k, this.x, this.y + k*60);
    }
    
    //タスク表示
      //ラベル（タスクの属性...予定or締切or予測)
      //時刻
      
     //println(this.dateTime);
      /*stroke(colorBlack);
      strokeWeight(2);
      if (i != 11) {
        line(20, 185 + i * 60, width - 20, 185 + i * 60);  //区切り線
      }
      noStroke();*/
    }
=======
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
>>>>>>> 12076e07bd13217ffe04eb40cd54511fa7f6fee5
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
      Calendar day = Calendar.getInstance();
      println("planDate DATE aaaaa",planDate.get(i).get(Calendar.DATE));
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
   float x_b = width - 140, y_b = this.y - 40, w_b = 60, h_b = 30;
   rect(x_b, y_b, w_b, h_b);  //種別の背景になる四角形を表示
   
   textFont(mgenplus_heavy);
   textBox(taskType, colorWhite,20, x_b, y_b, w_b, h_b);  //種別を表示
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
