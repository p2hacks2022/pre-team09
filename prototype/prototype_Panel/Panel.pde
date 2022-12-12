abstract class UI {
 float x, y, w, h; 
}

class Panel extends UI{//もしかするとextends Taskになる可能性あり？
  Timestamp  dateTime;
  
  Panel(float x, float y, float w, float h, Timestamp dateTime){
    //インスタンス：座標大きさ(x,y,w,h), 年月日日(dateTime)
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dateTime = dateTime;
  }
  Panel(float y, float h, int width, float screen_ratio,  Timestamp dateTime){
    //インスタンス：座標(y), 高さ<(h)>, 幅<画面幅(width), パネルの画面幅比(scree_ratio)>,  年月日日(dateTime)
    this.x = width*(1 - screen_ratio)/2;
    this.y = y;
    this.w = width*screen_ratio;
    this.h = h;
    this.dateTime = dateTime;
  }
  
  void mouseWheel(MouseEvent event){
    println(event.getAmount());
  }
  
  void draw(){
    fill(255);
    rect(this.x,this.y,this.w,this.h);
    fill(0);
    
    /*textボックスのクラスが必要！！*/
    //日付表示
    textSize(20);
    text(str(this.dateTime.getDate()), this.x, this.y);
    
    //タスク表示
      //ラベル（タスクの属性...予定or締切or予測)
      //時刻
      
     //println(this.dateTime);
  }
}


//タスク管理
class Task {
  String taskTitle;
  Timestamp yearDateTime;
  
  
}
